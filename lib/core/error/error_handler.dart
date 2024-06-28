import 'package:dio/dio.dart';
class ApiErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return "Request to API server was cancelled";
        case DioExceptionType.connectionTimeout:
          return "Connection timeout with API server";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with API server";
        case DioExceptionType.sendTimeout:
          return "Send timeout in connection with API server";
        case DioExceptionType.badResponse:
          return _handleServerError(error.response?.statusCode);
        case DioExceptionType.badCertificate:
          return "Bad Certificate";
        case DioExceptionType.connectionError:
          return "Connection error";
        case DioExceptionType.unknown:
        default:
          return "Unexpected error occurred";
      }
    } else {
      return "Unexpected error occurred";
    }
  }

  static String _handleServerError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
      case 502:
      case 503:
      case 504:
        return "Internal server error";
      default:
        return "Unexpected server error";
    }
  }
}
