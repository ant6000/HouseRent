import 'package:get/get.dart';
import 'package:house_rent/core/error/error_handler.dart';
import 'package:house_rent/core/helper/shared_pref.dart';
import 'package:house_rent/data/repository/auth/auth_repo.dart';
import 'package:house_rent/services/http_services.dart';
import 'package:house_rent/services/http_services_impl.dart';
import 'package:dio/dio.dart' as dio;

class AuthRepoImpl implements AuthRepo {
  late HttpService _httpService;
  AuthRepoImpl() {
    _httpService = Get.put(HttpServicesImpl());
    _httpService.init();
  }

  @override
  Future<dio.Response> signIn(String url, Map<String, String> data) async {
    try {
      return await _httpService.postRequest(url, null, data);
    } on Exception catch (e) {
      throw Exception(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(String url, Map<String, String> data) async {
    try {
      final response = await _httpService.postRequest(url, data);
    } on Exception catch (e) {
      throw Exception(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<bool> refreshTokens(String refreshToken) async {
    final response = await _httpService.postRequest(
        'auth/refresh-token', {"refresh_token": refreshToken}, null);
    if (response.statusCode == 200) {
      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];
      SharedPref().setAccessToken(newAccessToken);
      SharedPref().setRefreshToken(newRefreshToken);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> validateAccessToken(String accessToken) async {
    try {
      final response =
          await _httpService.getRequest('auth/profile', accessToken, null);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
