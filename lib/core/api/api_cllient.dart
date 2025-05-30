import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

String _bearerToken = "";

String get bearertoken => _bearerToken;

setBearerToken(String token) => _bearerToken = token;

@module
abstract class CoreModules {
  @lazySingleton
  Dio get client => Dio();
}

abstract class ApiService {
  dynamic get();
}

@LazySingleton(as: ApiService)
class ApiServiceImpl implements ApiService {
  final Dio dio;

  ApiServiceImpl(this.dio);

  @override
  dynamic get() async {
    try {
      final response = await dio.get(
        'raw.githubusercontent.com/teewhydope/JoyFin-KMM/main/api/mock.json',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  _handleError(DioException e) {}
}
