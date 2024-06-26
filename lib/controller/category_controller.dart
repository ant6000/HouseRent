import 'dart:convert';

import 'package:get/get.dart';
import 'package:house_rent/data/repository/get_catagory_repo.dart';

class CategoryController extends GetxController {
  var selectedIndex = Rxn<int>();

  void onCategorySelected(int index) {
    selectedIndex.value = index;
  }

  RxList<String> categoryList = RxList<String>();

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    var result = await CategoryServices.getCategories();
    dynamic response = jsonDecode(result.body);
    for (var item in response['data']) {
      categoryList.add(item['attributes']['name']);
    }
  }
}
