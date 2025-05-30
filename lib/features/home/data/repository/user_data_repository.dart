import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zoja_assessment/core/api/error.dart';
import 'package:zoja_assessment/features/home/data/datasource/remote/user_remote_source.dart';
import 'package:zoja_assessment/features/home/data/model/user_model.dart';
import 'package:zoja_assessment/features/home/domain/repository/user_repository.dart';

@Injectable(as: UserRepository)
class UserDataRepository implements UserRepository {
  final UserRemoteSource remoteSource;

  UserDataRepository({required this.remoteSource});

  @override
  Future<Either<Failure, UserModel>> user() async {
    try {
      var response = await remoteSource.user();
      return Right(response);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
