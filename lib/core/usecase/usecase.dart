import 'package:diary_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType,Params>{
  Future<Either<Failure,SuccessType?>> call({required Params params});
}