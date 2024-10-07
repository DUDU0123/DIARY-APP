import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DiaryFeedRepository {
  Stream<Either<Failure,List<Diary>>> fetchDiaryEntries();
}
