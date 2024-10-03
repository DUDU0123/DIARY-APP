import 'package:diary_app/features/new_diary/data/datasources/diary_remote_data_source.dart';
import 'package:diary_app/features/new_diary/data/models/diary_model.dart';
import 'package:diary_app/features/new_diary/domain/entities/diary.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryRemoteDataSource remoteDataSource;

  DiaryRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> addDiaryEntry(Diary diary) async {
    final diaryModel = DiaryModel(
      id: diary.id,
      title: diary.title,
      content: diary.content,
      createdAt: diary.createdAt,
    );
    await remoteDataSource.addDiaryEntry(diaryModel);
  }
}
