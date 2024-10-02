import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/domain/entity/user_entity/user_entity.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignupUsecase implements Usecase<String, UserEntity> {
  final AuthenticationRepository authenticationRepository;
  UserSignupUsecase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, String?>> call({required UserEntity params}) {
    return authenticationRepository.signUpUser(
      email: params.userEmail ?? '',
      password: params.userPassword ?? '',
    );
  }
}
