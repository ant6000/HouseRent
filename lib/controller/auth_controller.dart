import 'package:get/get.dart';
import 'package:house_rent/data/repository/auth/auth_repo.dart';
import 'package:house_rent/data/repository/auth/auth_repo_impl.dart';

class AuthController extends GetxController {
  late AuthRepo _authRepo;
  AuthController() {
    _authRepo = Get.put(AuthRepoImpl());
  }
  RxBool isLoading = false.obs;
  void userSignIn(String email, String password) {
    final body ={'email':email,
    'password':password};
    _authRepo.signIn('auth/login',body);
  }

  void userSignUP(){
    
  }
}
