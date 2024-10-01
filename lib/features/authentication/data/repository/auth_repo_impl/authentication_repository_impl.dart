import 'package:diary_app/features/authentication/data/data_sources/authentication_remote_data.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteData authenticationData;
  AuthenticationRepositoryImpl({
    required this.authenticationData,
  });
}
