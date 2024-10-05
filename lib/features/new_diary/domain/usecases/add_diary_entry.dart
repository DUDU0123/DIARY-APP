import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddDiaryEntry implements Usecase<void, Diary> {
  final DiaryRepository repository;

  AddDiaryEntry(this.repository);

  @override
  Future<Either<Failure, void>> call({required Diary params}) async {
    return await repository.addDiaryEntry(params);
  }
}
