import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/diary_model.dart';

abstract class DiaryRemoteDataSource {
  Future<void> addDiaryEntry(DiaryModel diaryModel);
}

class DiaryRemoteDataSourceImpl implements DiaryRemoteDataSource {
  final FirebaseFirestore firestore;

  DiaryRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> addDiaryEntry(DiaryModel diaryModel) async {
    await firestore
        .collection('diary')
        .doc(diaryModel.id)
        .set(diaryModel.toMap());
  }
}
