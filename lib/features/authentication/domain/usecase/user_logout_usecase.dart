import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class UserLogoutUsecase {
  final AuthenticationRepository authenticationRepository;
  UserLogoutUsecase({
    required this.authenticationRepository,
  });
}
