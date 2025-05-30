import 'package:injectable/injectable.dart';
import 'package:zoja_assessment/core/api/api_cllient.dart';
import 'package:zoja_assessment/features/home/data/model/user_model.dart';

import 'user_remote_source.dart';

@Injectable(as: UserRemoteSource)
class UserRemoteDataSource implements UserRemoteSource {
  final ApiService apiService;

  UserRemoteDataSource({required this.apiService});

  @override
  Future<UserModel> user() async {
    final response = await apiService.get();
    return UserModel.fromJson(response);
  }
}
