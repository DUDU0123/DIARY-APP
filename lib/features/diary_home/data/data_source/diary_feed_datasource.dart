import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exceptions/exceptions.dart';
import '../../../../core/error/exceptions/firebase_exception_handler.dart';
import '../../../new_diary/data/models/diary_model.dart';

abstract class DiaryFeedDatasource {
  Stream<List<DiaryModel>> fetchDiaryEntries();
}

class DiaryFeedDatasourceImpl implements DiaryFeedDatasource {
  final FirebaseFirestore firestore;

  DiaryFeedDatasourceImpl({required this.firestore});
  @override
  Stream<List<DiaryModel>> fetchDiaryEntries() {
    final currentUser = serviceLocator<FirebaseAuth>().currentUser;
    try {
      if (currentUser == null) {
        throw ClientException(message: 'No user found');
      }
      return firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('diary')
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => DiaryModel.fromMap(doc.data()))
              .toList());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.getFirebaseAuthExceptionMessage(
        firebaseAuthException: e,
      );
    } catch (e) {
      throw ServerException(message: "An unexpected error occured");
    }
  }
}
