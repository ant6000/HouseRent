import 'dart:convert';
import 'package:get/get.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/data/repository/best_for_you.dart';

class BestForYouController extends GetxController {
  RxList<CustomModel> houseList = RxList<CustomModel>();
  RxList<String> images = RxList<String>();

  @override
  void onInit() {
    getBestForYouHouses();
    super.onInit();
  }

  void getBestForYouHouses() async {
    var result = await BestForYou.getHouses();
    dynamic response = jsonDecode(result.body);
    if (response['data'] != null) {
      var houses = response['data'] as List;
      for (var house in houses) {
        houseList.add(CustomModel.fromJson(house));
      }
    }
  }
}
