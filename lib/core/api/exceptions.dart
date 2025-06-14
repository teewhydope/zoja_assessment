import 'dart:io';

import 'package:dio/dio.dart';

class NetworkException implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        if (dioException.response?.data is Map<String, dynamic>) {
          final data = dioException.response!.data as Map<String, dynamic>;
          if (data.containsKey('error_msg')) {
            message = data['error_msg'].toString();
          } else if (data.containsKey('message')) {
            message = data['message'].toString();
          } else if (data.containsKey('error')) {
            message = data['error']['message'];
          } else {
            message = data.toString();
          }
        } else {
          message = dioException.response!.data.toString();
        }
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }
}
