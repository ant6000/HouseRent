import 'package:get/get.dart';
import 'package:house_rent/data/repository/auth/auth_repo.dart';
import 'package:house_rent/services/http_services.dart';
import 'package:house_rent/services/http_services_impl.dart';

class AuthRepoImpl implements AuthRepo {
  late HttpService _httpService;
  AuthRepoImpl() {
    _httpService = Get.put(HttpServicesImpl());
    _httpService.init();
  }

  @override
  Future<void> signIn(String url, Map<String, String> data) async {
    try {
      print(data);
      final response = await _httpService.postRequest(url, data);
    } on Exception catch (e) {
      throw Exception(e.toString());
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
      final response = await _httpService.getRequest(url);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
