part of 'diary_feed_cubit.dart';

sealed class DiaryFeedState extends Equatable {
  const DiaryFeedState();

  @override
  List<Object> get props => [];
}

final class DiaryFeedInitial extends DiaryFeedState {}

final class DiaryFeedLoading extends DiaryFeedState {}

final class DiaryFeedSuccess extends DiaryFeedState {
  final List<Diary> myDiaries;
  @override
  List<Object> get props => [myDiaries];
  const DiaryFeedSuccess({required this.myDiaries});
}

final class DiaryFailure extends DiaryFeedState {
  final String failureMsg;
  @override
  List<Object> get props => [failureMsg];
  const DiaryFailure({required this.failureMsg});
}
