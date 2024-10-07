part of 'diary_manager_bloc.dart';

sealed class DiaryManagerState extends Equatable {
  const DiaryManagerState();

  @override
  List<Object> get props => [];
}

final class DiaryManagerInitial extends DiaryManagerState {}

final class DiaryAdded extends DiaryManagerState {}

final class DiaryAddingFailed extends DiaryManagerState {}

final class DiaryAdding extends DiaryManagerState {}

final class DiaryEditing extends DiaryManagerState {}

final class DiaryEdited extends DiaryManagerState {}

final class DiaryEditFailed extends DiaryManagerState {}

final class DiaryDeleting extends DiaryManagerState {}

final class DiaryDeleted extends DiaryManagerState {}

final class DiaryDeleteFailed extends DiaryManagerState {}
