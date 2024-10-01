import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class UserLoginUsecase {
  final AuthenticationRepository authenticationRepository;
  UserLoginUsecase({
    required this.authenticationRepository,
  });
}
