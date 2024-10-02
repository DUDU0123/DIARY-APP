import 'package:diary_app/core/error/exceptions/exceptions.dart';
import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/features/authentication/data/data_sources/authentication_remote_data.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteData authenticationData;
  AuthenticationRepositoryImpl({
    required this.authenticationData,
  });

  @override
  Future<Either<Failure, String?>> getCurrentUserId() async {
    try {
      final value = authenticationData.getCurrentUserId();
      return right(value);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool?>> logOutUser() async {
    try {
      final value = await authenticationData.logOutUser();
      return right(value);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> loginUser(
      {required String email, required String password}) async {
    try {
      final value =
          await authenticationData.loginUser(email: email, password: password);
      return right(value);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> signUpUser(
      {required String email, required String password}) async {
    try {
      final value =
          await authenticationData.signUpUser(email: email, password: password);
      return right(value);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } on ClientException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
