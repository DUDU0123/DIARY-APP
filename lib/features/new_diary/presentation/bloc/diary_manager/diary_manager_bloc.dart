import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/domain/usecases/add_diary_entry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'diary_manager_event.dart';
part 'diary_manager_state.dart';

class DiaryManagerBloc extends Bloc<DiaryManagerEvent, DiaryManagerState> {
  final AddDiaryEntry addDiaryEntryUseCase;

  DiaryManagerBloc(this.addDiaryEntryUseCase) : super(DiaryManagerInitial()) {
    on<AddDiaryEvent>((event, emit) async {
      emit(DiaryAdding());
      try {
        await addDiaryEntryUseCase(params: event.diary);
        emit(DiaryAdded());
      } catch (e) {
        emit(DiaryAddingFailed());
      }
    });
  }
}
