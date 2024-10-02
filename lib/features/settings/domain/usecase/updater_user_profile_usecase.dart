import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/domain/repository/profile_manager_repo/profile_manager_repo.dart';
import 'package:fpdart/fpdart.dart';

class UpdaterUserProfileUsecase implements Usecase<void, UserModel?> {
  final ProfileManagerRepo profileManagerRepo;
  UpdaterUserProfileUsecase({
    required this.profileManagerRepo,
  });
  @override
  Future<Either<Failure, void>> call({required UserModel? params}) async {
    return await profileManagerRepo.updateUserProfile(updatedUserData: params);
  }
}
