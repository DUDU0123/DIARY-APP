import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/diary_home/domain/repository/diary_feed_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDiariesUseCases {
  final DiaryFeedRepository diaryFeedRepository;

  GetDiariesUseCases({required this.diaryFeedRepository});

  Stream<Either<Failure, List<Diary>>> call() {
    return diaryFeedRepository.fetchDiaryEntries();
  }
}
