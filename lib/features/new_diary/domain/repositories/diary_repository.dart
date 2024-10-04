import 'package:diary_app/features/new_diary/domain/entities/diary.dart';

abstract class DiaryRepository {
  Future<void> addDiaryEntry(Diary diary);
}
