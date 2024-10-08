import 'dart:async';

import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/diary_home/domain/usecases/get_diaries.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'diary_feed_state.dart';

class DiaryFeedCubit extends Cubit<DiaryFeedState> {
  final GetDiariesUseCases getDiariesUseCases;
  StreamSubscription<Either<Failure, List<Diary>>>? _diarySubscription;
  List<Diary> _allDiaries = [];

  DiaryFeedCubit({required this.getDiariesUseCases})
      : super(DiaryFeedInitial());

  Future<void> fetchDiaries() async {
    emit(DiaryFeedLoading());
    _diarySubscription?.cancel();
    final streamRes = getDiariesUseCases.call();
    _diarySubscription = streamRes.listen(
      (value) {
        value.fold(
          (failure) => emit(DiaryFailure(failureMsg: failure.message)),
          (success) {
            _allDiaries = success;
            emit(DiaryFeedSuccess(myDiaries: success));
          },
        );
      },
      onError: (error) => emit(
        DiaryFailure(
          failureMsg: error.toString(),
        ),
      ),
    );
  }

  void searchDiaries(String query) {
    if (query.isEmpty) {
      emit(DiaryFeedSuccess(myDiaries: _allDiaries));
    } else {
      final filteredDiaries = _allDiaries.where((diary) {
        return diary.title.toLowerCase().contains(query.toLowerCase()) ||
            diary.content.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(DiaryFeedSuccess(myDiaries: filteredDiaries));
    }
  }

  @override
  Future<void> close() {
    _diarySubscription?.cancel();
    return super.close();
  }
}
