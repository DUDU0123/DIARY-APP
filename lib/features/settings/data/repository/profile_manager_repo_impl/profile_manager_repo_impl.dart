import 'dart:io';
import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/data/data_sources/profile_manager/profile_manager.dart';
import 'package:diary_app/features/settings/domain/repository/profile_manager_repo/profile_manager_repo.dart';
import 'package:fpdart/fpdart.dart';

class ProfileManagerRepoImpl implements ProfileManagerRepo {
  final ProfileManager profileManager;
  ProfileManagerRepoImpl({
    required this.profileManager,
  });
  @override
  Future<Either<Failure, void>> updateUserProfile(
      {required UserModel? updatedUserData}) async {
    try {
      final res = await profileManager.updateUserProfile(
          updatedUserData: updatedUserData);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfileImage({
    required File file,
    required UserModel currentUserModel,
  }) async {
    try {
      final res = await profileManager.updateUserProfileImage(
          file: file, currentUserModel: currentUserModel);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
