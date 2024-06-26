import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/controller/best_for_you_controller.dart';
import 'package:house_rent/controller/nearest_house_controller.dart';
import 'package:house_rent/views/widgets/house_card_big.dart';
import 'package:house_rent/views/widgets/house_card_small.dart';

class SeeMorePage extends StatelessWidget {
  final String type;
  SeeMorePage({super.key, required this.type});
  final nearestController = Get.find<NearestHoueController>();
  final best4uController = Get.find<BestForYouController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Image.asset('lib/assets/IC_Search.png'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Search Address or near you'),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Image.asset('lib/assets/filter_icon.png')
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: type == 'grid'
              ? GridView.builder(
                  itemCount: nearestController.houseList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    return HouseCardBig(
                      houseModel: nearestController.houseList[index],
                    );
                  },
                )
              : ListView.builder(
                  itemCount: best4uController.houseList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: HouseCardSmall(
                          houseModel: best4uController.houseList[index]),
                    );
                  },
                )),
    );
  }
}
