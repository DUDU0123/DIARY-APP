import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/constants/db_field_name_constants.dart';
import 'package:diary_app/core/utils/common_db_functions.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/error/exceptions/exceptions.dart';

abstract interface class ProfileManager {
  Future<void> updateUserProfile({required UserModel? updatedUserData});
  Future<void> updateUserProfileImage({
    required File file,
    required UserModel currentUserModel,
  });
}

class ProfileManagerImpl implements ProfileManager {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  ProfileManagerImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });
  @override
  Future<void> updateUserProfile({required UserModel? updatedUserData}) async {
    try {
      if (firebaseAuth.currentUser == null || updatedUserData == null) {
        throw ServerException(message: 'No user found');
      }
      final currentUserData = await CommonDbFunctions.getUserDataByIdAsFuture(
          userId: firebaseAuth.currentUser?.uid);
          log("Outside");
      if (currentUserData?.userPassword != updatedUserData.userPassword) {
        log("inside update password");
        await firebaseAuth.currentUser
            ?.updatePassword(updatedUserData.userPassword!);
      }
      await firebaseFirestore
          .collection(usersCollection)
          .doc(updatedUserData.userId)
          .update(
            updatedUserData.toJson(),
          );
    } on FirebaseException catch (e) {
      // throw FirebaseExceptionHandler.getFirebaseException(firebaseException: e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> updateUserProfileImage({
    required File file,
    required UserModel currentUserModel,
  }) async {
    try {
      if (firebaseAuth.currentUser == null) {
        throw ServerException(message: 'No user found');
      }
      final downloadUrl = await CommonDbFunctions.saveUserFileToDataBaseStorage(
          pathForFile: '/${firebaseAuth.currentUser?.uid}', file: file);
      final updatedUserData = currentUserModel.copyWith(
        userProfilePic: downloadUrl,
      );
      await updateUserProfile(updatedUserData: updatedUserData);
    } on FirebaseException catch (e) {
      // throw FirebaseExceptionHandler.getFirebaseException(firebaseException: e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
