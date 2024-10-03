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
