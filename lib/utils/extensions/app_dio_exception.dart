import 'package:dio/dio.dart';

extension AppFirebaseAuthException on DioException {
  String get userFriendlyMessage {
    if (response != null && response?.statusCode != null) {
      switch (response?.statusCode) {
        case 400:
          return 'Invalid request';
        case 401:
          return 'Invalid credentials';
        case 403:
          return response?.data['detail'] ?? 'You are not authorized to perform this action';
        case 404:
          return 'Resource not found';
        case 500:
          return 'Internal server error';
        case 503:
          return 'Service unavailable';
        default:
          return 'Something went wrong';
      }
    } else {
      return 'Something went wrong';
    }
  }
}
