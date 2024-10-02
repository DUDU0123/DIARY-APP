import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/core/constants/db_field_name_constants.dart';
import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CommonDbFunctions {
  static Stream<UserModel>? getUserDataByIdAsStream({
    required String? userId,
  }) {
    try {
      return serviceLocator
          .get<FirebaseFirestore>()
          .collection(usersCollection)
          .doc(userId)
          .snapshots()
          .map((data) => UserModel.fromJson(data.data()!));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<UserModel?>? getUserDataByIdAsFuture({
    required String? userId,
  }) async {
    try {
      final userDocSnap = await serviceLocator
          .get<FirebaseFirestore>()
          .collection(usersCollection)
          .doc(userId)
          .get();
      if (userDocSnap.exists) {
        return UserModel.fromJson(userDocSnap.data()!);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<String> saveUserFileToDataBaseStorage({
    required String pathForFile,
    required File file,
  }) async {
    try {
      UploadTask uploadTask = serviceLocator
          .get<FirebaseStorage>()
          .ref()
          .child(pathForFile)
          .putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw ServerException(message: "Error while saving file to storage: $e");
    } catch (e) {
      throw ServerException(message: "Error while saving file to storage: $e");
    }
  }
}
