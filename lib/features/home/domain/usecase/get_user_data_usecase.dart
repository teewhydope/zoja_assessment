import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zoja_assessment/core/api/error.dart';
import 'package:zoja_assessment/core/domain/usecase.dart';
import 'package:zoja_assessment/features/home/data/model/user_model.dart';
import 'package:zoja_assessment/features/home/domain/repository/user_repository.dart';

@lazySingleton
class GetUserDataUseCase extends UseCase<UserModel, NoParams> {
  final UserRepository repository;

  GetUserDataUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams param) async {
    return await repository.user();
  }
}
