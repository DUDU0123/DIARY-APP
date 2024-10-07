import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/domain/usecases/add_diary_entry.dart';
import 'package:diary_app/features/new_diary/domain/usecases/delete_diary_entry.dart';
import 'package:diary_app/features/new_diary/domain/usecases/ediit_diary_entry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'diary_manager_event.dart';
part 'diary_manager_state.dart';

class DiaryManagerBloc extends Bloc<DiaryManagerEvent, DiaryManagerState> {
  final AddDiaryEntry addDiaryEntryUseCase;
  final EditDiaryEntry ediitDiaryEntryUsecase;
  final DeleteDiaryEntry deleteDiaryUseCase;
  DiaryManagerBloc(this.addDiaryEntryUseCase, this.ediitDiaryEntryUsecase,
      this.deleteDiaryUseCase)
      : super(DiaryManagerInitial()) {
    on<AddDiaryEvent>((event, emit) async {
      emit(DiaryAdding());
      try {
        await addDiaryEntryUseCase(params: event.diary);
        emit(DiaryAdded());
      } catch (e) {
        emit(DiaryAddingFailed());
      }
    });
    on<EditDiary>((event, emit) async {
      emit(DiaryEditing());
      try {
        await ediitDiaryEntryUsecase.call(params: event.diary);
        emit(DiaryEdited());
      } catch (e) {
        emit(DiaryEditFailed());
      }
    });
    on<DeleteDiary>((event, emit) async {
      emit(DiaryDeleting());
      try {
        deleteDiaryUseCase.call(params: event.id);
        emit(DiaryDeleted());
      } catch (e) {
        emit(DiaryDeleted());
      }
    });
  }
}
