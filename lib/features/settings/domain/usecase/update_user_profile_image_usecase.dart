import 'dart:io';

import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/domain/repository/profile_manager_repo/profile_manager_repo.dart';
import 'package:fpdart/fpdart.dart';
class UpdateUserProfileImageUsecase implements Usecase<void, UserParams> {
  final ProfileManagerRepo profileManagerRepo;
  UpdateUserProfileImageUsecase({
    required this.profileManagerRepo,
  });
  @override
  Future<Either<Failure, void>> call({required UserParams params,})async {
    return await profileManagerRepo.updateUserProfileImage(file: params.file, currentUserModel: params.userModel);
  }

}

class UserParams {
  final File file;
  final UserModel userModel;
  UserParams({
    required this.file,
    required this.userModel,
  });
}
