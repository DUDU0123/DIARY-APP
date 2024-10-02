import 'package:diary_app/core/error/failure.dart';
import 'package:diary_app/core/usecase/usecase.dart';
import 'package:diary_app/features/authentication/domain/repository/auth_repo/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';
class GetCurrentUserIdUsecase implements Usecase<String,Null>{
  final AuthenticationRepository authenticationRepository;
  GetCurrentUserIdUsecase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<Failure, String?>> call({required Null params}) async{
   return await authenticationRepository.getCurrentUserId();
  }
}
