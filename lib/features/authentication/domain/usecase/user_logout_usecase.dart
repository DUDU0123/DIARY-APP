import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogoutUsecase implements Usecase<bool, Null> {
  final AuthenticationRepository authenticationRepository;
  UserLogoutUsecase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, bool?>> call({required Null params}) async {
    return await authenticationRepository.logOutUser();
  }
}
