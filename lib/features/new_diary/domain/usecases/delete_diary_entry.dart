import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/src/either.dart';

class DeleteDiaryEntry implements Usecase {
  final DiaryRepository repository;

  DeleteDiaryEntry(this.repository);
  @override
  Future<Either<Failure, dynamic>> call({required params}) async {
    try {
      final test = await repository.deleteDiary(params);
      return Right(test);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
