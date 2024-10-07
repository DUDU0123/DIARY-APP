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

  DiaryFeedCubit({required this.getDiariesUseCases})
      : super(DiaryFeedInitial());

  Future<void> fetchDiaries() async {
    emit(DiaryFeedLoading());
    _diarySubscription?.cancel();
    final streamRes = getDiariesUseCases.call();
    streamRes.listen(
      (value) {
        value.fold(
          (failure) => emit(DiaryFailure(failureMsg: failure.message)),
          (success) => emit(
            DiaryFeedSuccess(myDiaries: success),
          ),
        );
      },
      onError: (error) => emit(
        DiaryFailure(
          failureMsg: error.toString(),
        ),
      ),
    );
  }
}
