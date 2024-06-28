import 'package:dio/dio.dart';
import 'package:house_rent/core/error/error_handler.dart';
import 'package:house_rent/services/http_services.dart';

const BASE_URL = 'https://api.escuelajs.co/api/v1/';

class HttpServicesImpl implements HttpService {
  late Dio _dio;
  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    initializeIterceptors();
  }

  @override
  Future<Response> getRequest(String url, [var header, var data]) async {
    Response response;
    try {
      response = await _dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $header'}),
          data: data);
    } on DioException catch (e) {
      throw Exception(ApiErrorHandler.handleError(e));
    }
    return response;
  }

  @override
  Future<Response> postRequest(String url, [var header, var data]) async {
    Response response;
    try {
      response = await _dio.post(url,
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $header'}));
    } on DioException catch (e) {
      throw Exception(ApiErrorHandler.handleError(e));
    }
    return response;
  }

  initializeIterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        print(response.data);
        handler.next(response);
      },
      onError: (error, handler) {
        print(error.message);
        handler.next(error);
      },
    ));
  }
}
