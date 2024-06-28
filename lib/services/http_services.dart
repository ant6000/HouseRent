import 'package:dio/dio.dart';

abstract class HttpService {
  void init();
  Future<Response> getRequest(String url, [var header,var data]);
  Future<Response> postRequest(String url,[var header, var data]);
}
