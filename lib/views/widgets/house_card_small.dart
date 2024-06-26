import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/views/screens/details_page.dart';

class HouseCardSmall extends StatelessWidget {
  final CustomModel houseModel;
  const HouseCardSmall({required this.houseModel, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>DetailsPage(houseModel: houseModel));
      },
      child: SizedBox(
        height: 76.h,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network('http://192.168.185.124:1337${houseModel.attributes?.images?.data?[0].attributes?.url}',
                  width: 80.w,
                  height: 76.h,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    houseModel.attributes?.houseTitle ?? 'Default',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow
                        .ellipsis, // Ensure text truncates with an ellipsis
                  ),
                  Text('${houseModel.attributes?.price.toString()}.TK /Mo',
                      style: TextStyle(
                          fontSize: 12.83.sp, fontWeight: FontWeight.w400)),
                  Row(
                    children: [
                      Image.asset('lib/assets/IC_Bed.png'),
                      SizedBox(width: 5.w),
                      Text('${houseModel.attributes?.bed} Bed',
                          style: TextStyle(
                              fontSize: 12.83.sp, fontWeight: FontWeight.w400)),
                      SizedBox(width: 10.w),
                      Image.asset('lib/assets/IC_Bath.png'),
                      SizedBox(width: 5.w),
                      Text('${houseModel.attributes?.bath} Bath',
                          style: TextStyle(
                              fontSize: 12.83.sp, fontWeight: FontWeight.w400)),
                      SizedBox(width: 5.w),
                      Image.asset('lib/assets/IC_Bath.png'),
                      Text('${houseModel.attributes?.kitchen} Kitc.',
                          style: TextStyle(
                              fontSize: 12.83.sp, fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
