import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/diary_model.dart';

abstract class DiaryRemoteDataSource {
  Future<void> addDiaryEntry(DiaryModel diaryModel);
  Future<void> editDiaryEntry(DiaryModel diaryModel);
  Future<void> deleteDiaryEntry(String diaryId);
}

class DiaryRemoteDataSourceImpl implements DiaryRemoteDataSource {
  final FirebaseFirestore firestore;

  DiaryRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> addDiaryEntry(DiaryModel diaryModel) async {
    final currentUser = serviceLocator<FirebaseAuth>().currentUser;
    try {
      if (currentUser != null) {
        final DocumentReference<Map<String, dynamic>> reference = firestore
            .collection('users')
            .doc(currentUser.uid)
            .collection('diary')
            .doc(diaryModel.id);

        await reference.set(diaryModel.toMap());
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  // Edit a diary entry
  @override
  Future<void> editDiaryEntry(DiaryModel diaryModel) async {
    final currentUser = serviceLocator<FirebaseAuth>().currentUser;
    try {
      if (currentUser != null) {
        final DocumentReference<Map<String, dynamic>> reference = firestore
            .collection('users')
            .doc(currentUser.uid)
            .collection('diary')
            .doc(diaryModel.id);

        await reference.update(diaryModel.toMap());
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  // Delete a diary entry
  @override
  Future<void> deleteDiaryEntry(String diaryId) async {
    final currentUser = serviceLocator<FirebaseAuth>().currentUser;
    try {
      if (currentUser != null) {
        final DocumentReference<Map<String, dynamic>> reference = firestore
            .collection('users')
            .doc(currentUser.uid)
            .collection('diary')
            .doc(diaryId);

        await reference.delete();
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
