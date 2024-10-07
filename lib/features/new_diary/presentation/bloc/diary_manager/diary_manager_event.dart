part of 'diary_manager_bloc.dart';

sealed class DiaryManagerEvent extends Equatable {
  const DiaryManagerEvent();

  @override
  List<Object> get props => [];
}

final class AddDiaryEvent extends DiaryManagerEvent {
  final Diary diary;

  const AddDiaryEvent(this.diary);
}

final class EditDiary extends DiaryManagerEvent {
  final Diary diary;

  const EditDiary(this.diary);
}

final class DeleteDiary extends DiaryManagerEvent {
  final String id;

  const DeleteDiary(this.id);
}
