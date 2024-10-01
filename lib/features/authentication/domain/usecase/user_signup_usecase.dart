import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class UserSignupUsecase {
  final AuthenticationRepository authenticationRepository;
  UserSignupUsecase({
    required this.authenticationRepository,
  });
}
