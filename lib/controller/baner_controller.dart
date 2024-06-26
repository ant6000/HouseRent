import 'dart:convert';

import 'package:get/get.dart';
import 'package:house_rent/data/model/custom_banner_model.dart';
import 'package:house_rent/data/repository/get_banner.dart';

class BanerController extends GetxController {
  RxList<String> bannerList = RxList<String>();

  @override
  void onInit() {
    getBannerList();
    super.onInit();
  }

  Future getBannerList() async {
    var result = await GetBanner.getBanner();
    final response = jsonDecode(result.body);
    var images = response['data']['attributes']['image']['data'];
    for (var element in images) {
      var urlList = ImageAttributes.fromJson(element['attributes']);
      bannerList.add('http://192.168.185.124:1337${urlList.url}');
    }
  }
}
