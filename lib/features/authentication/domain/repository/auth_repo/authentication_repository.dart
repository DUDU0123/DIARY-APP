import 'package:diary_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthenticationRepository{
  Future<Either<Failure, String?>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<Failure,String?>> signUpUser({
    required String email,
    required String password,
  });
  Future<Either<Failure,String?>> getCurrentUserId();
  Future<Either<Failure,bool?>> logOutUser();
}