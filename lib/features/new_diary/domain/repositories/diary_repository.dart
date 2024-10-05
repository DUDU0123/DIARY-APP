import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:fpdart/fpdart.dart';

abstract class DiaryRepository {
  Future<Either<Failure, void>> addDiaryEntry(Diary diary);
}
