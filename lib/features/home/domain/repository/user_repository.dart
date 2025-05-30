import 'package:dartz/dartz.dart';
import 'package:zoja_assessment/core/api/error.dart';
import 'package:zoja_assessment/features/home/data/model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> user();
}
