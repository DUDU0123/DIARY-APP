import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/new_diary/data/datasources/diary_remote_data_source.dart';
import 'package:diary_app/features/new_diary/data/models/diary_model.dart';
import 'package:diary_app/features/new_diary/domain/entities/diary.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';
import 'package:fpdart/src/either.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryRemoteDataSource remoteDataSource;

  DiaryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addDiaryEntry(Diary diary) async {
    final diaryModel = DiaryModel(
      id: diary.id,
      title: diary.title,
      content: diary.content,
      createdAt: diary.createdAt,
    );
    try {
      final test = await remoteDataSource.addDiaryEntry(diaryModel);
      return Right(test);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
