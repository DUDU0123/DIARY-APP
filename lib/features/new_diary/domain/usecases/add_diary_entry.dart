import 'package:diary_app/features/new_diary/domain/entities/diary.dart';
import 'package:diary_app/features/new_diary/domain/repositories/diary_repository.dart';

class AddDiaryEntry {
  final DiaryRepository repository;

  AddDiaryEntry(this.repository);

  Future<void> call(Diary diary) async {
    await repository.addDiaryEntry(diary);
  }
}
