import 'package:dartz/dartz.dart';
import 'package:zoja_assessment/core/api/error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
