import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rent/core/helper/shared_pref.dart';
import 'package:house_rent/data/repository/auth/auth_repo.dart';
import 'package:house_rent/data/repository/auth/auth_repo_impl.dart';

class AuthController extends GetxController {
  late AuthRepo _authRepo;
  AuthController() {
    _authRepo = Get.find<AuthRepoImpl>();
  }
  RxBool isLoading = false.obs;

  Future<void> userSignIn(String email, String password) async {
    final body = {'email': email, 'password': password};
    try {
      isLoading.toggle();
      final response = await _authRepo.signIn('auth/login', body);
      if (response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['refresh_token'];
        await SharedPref().setAccessToken(accessToken);
        await SharedPref().setRefreshToken(refreshToken);
        Get.toNamed('/homePage');
      } else {
        Get.showSnackbar(GetSnackBar(title: 'Error',message: response.statusMessage,duration: const Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(title: 'Error',message: e.toString(),duration: const Duration(seconds: 3),snackPosition: SnackPosition.BOTTOM,));
    } finally {
      isLoading.toggle();
    }
  }

  Future<void> userSignUP(String name, String email, String password) async {
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'avatar':
          'https://www.shareicon.net/data/512x512/2016/07/26/802043_man_512x512.png'
    };
    try {
      isLoading.toggle();
      await _authRepo.signIn('users/', data);
    } catch (e) {
      print(e.toString());
      isLoading.toggle();
    } finally {
      isLoading.toggle();
      userSignIn(name, email);
      // call the singin method
      Get.toNamed('/homePage');
    }
  }
}
