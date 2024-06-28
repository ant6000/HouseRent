import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_rent/core/helper/shared_pref.dart';
import 'package:house_rent/data/repository/auth/auth_repo.dart';
import 'package:house_rent/data/repository/auth/auth_repo_impl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String? access_token;
  late String? refresh_token;
  late AuthRepo _authRepo;
  @override
  void initState() {
    super.initState();
    _authRepo = Get.find<AuthRepoImpl>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTokens();
    });
  }

  Future<void> _checkTokens() async {
    access_token = SharedPref().getAccessToken();
    refresh_token = SharedPref().getRefreshToken();
    print(access_token);
    if (access_token == null && refresh_token == null) {
      Get.toNamed('/loginPage');
    } else {
      bool isAccessTokenValid =
          await _authRepo.validateAccessToken(access_token!);
      if (isAccessTokenValid) {
        Get.offNamed('/homePage');
      } else if (refresh_token != null) {
        bool isRefreshed = await _authRepo.refreshTokens(refresh_token!);
        if (isRefreshed) {
          Get.offNamed('/homePage');
        } else {
          Get.offNamed('/loginPage');
        }
      } else {
        Get.offNamed('/loginPage');
      }
      Get.toNamed('/homePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen', style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
