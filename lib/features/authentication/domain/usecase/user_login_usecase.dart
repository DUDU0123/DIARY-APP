import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginUsecase implements Usecase<String, UserEntity> {
  final AuthenticationRepository authenticationRepository;
  UserLoginUsecase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, String?>> call({required UserEntity params}) async {
    return await authenticationRepository.loginUser(
      email: params.userEmail ?? '',
      password: params.userPassword ?? '',
    );
  }
}
