import 'package:get/get.dart';
import 'package:house_rent/controller/auth/auth_controller.dart';
import 'package:house_rent/controller/baner_controller.dart';
import 'package:house_rent/controller/best_for_you_controller.dart';
import 'package:house_rent/controller/category_controller.dart';
import 'package:house_rent/controller/nearest_house_controller.dart';
import 'package:house_rent/data/repository/auth/auth_repo_impl.dart';
import 'package:house_rent/services/http_services_impl.dart';
class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(CategoryController());
    // Get.put(NearestHoueController());
    // Get.put(BestForYouController());
    // Get.put(BanerController());
  }
}

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepoImpl());
    Get.put(AuthController());
  }
  
}
