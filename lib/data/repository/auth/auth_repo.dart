import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Response> signIn(String url, Map<String, String> data);
  Future<void> signUp(String url, Map<String, String> data);
  Future<void> signOut();
  Future<bool> validateAccessToken(String accessToken);
  Future<bool> refreshTokens(String refreshToken);
}
