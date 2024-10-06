import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/fpdart.dart';

class EditDiaryEntry implements Usecase {
  final DiaryRepository repository;

  EditDiaryEntry(this.repository);

  @override
  Future<Either<Failure, dynamic>> call({required params}) async {
    return await repository.editDiaryEntry(params);
  }
}
