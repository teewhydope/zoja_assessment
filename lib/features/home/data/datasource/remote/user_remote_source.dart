import 'package:zoja_assessment/features/home/data/model/user_model.dart';

abstract class UserRemoteSource {
  Future<UserModel> user();
}
