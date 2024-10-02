import 'dart:io';
import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProfileManagerRepo{
  Future<Either<Failure,void>> updateUserProfile({required UserModel? updatedUserData});
  Future<Either<Failure,void>> updateUserProfileImage({
    required File file,
    required UserModel currentUserModel,
  });
}