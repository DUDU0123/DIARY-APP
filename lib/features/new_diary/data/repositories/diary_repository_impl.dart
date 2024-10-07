import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/new_diary/data/datasources/diary_remote_data_source.dart';
import 'package:diary_app/features/new_diary/data/models/diary_model.dart';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/fpdart.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryRemoteDataSource remoteDataSource;

  DiaryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addDiaryEntry(Diary diary) async {
    try {
      final test =
          await remoteDataSource.addDiaryEntry(DiaryModel.fromEntity(diary));
      return Right(test);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editDiaryEntry(Diary diary) async {
    try {
      return Right(
          await remoteDataSource.editDiaryEntry(DiaryModel.fromEntity(diary)));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDiary(String id) async {
    try {
      return Right(await remoteDataSource.deleteDiaryEntry(id));
    } catch (e) {
      print('print from diary repo');
      return left(Failure(message: e.toString()));
    }
  }
}
