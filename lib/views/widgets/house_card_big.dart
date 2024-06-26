import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/views/screens/details_page.dart';

class HouseCardBig extends StatelessWidget {
  final CustomModel houseModel;
  const HouseCardBig({required this.houseModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>DetailsPage(houseModel: houseModel));
      },
      child: SizedBox(
        width: 200.w,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(fit: StackFit.expand, children: [
              Image.network('http://192.168.185.124:1337${houseModel.attributes?.images?.data?[0].attributes?.url}', fit: BoxFit.cover),
              Positioned(
                  bottom: 5,
                  left: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(houseModel.attributes?.houseTitle ?? 'Default',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(houseModel.attributes?.location ?? 'Default',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ))
            ])),
      ),
    );
  }
}




// class HouseCardBig extends StatelessWidget {
//   const HouseCardBig({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed('/detailsPage');
//       },
//       child: SizedBox(
//         width: 200.w,
//         child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Stack(fit: StackFit.expand,
//               children: [
//               Image.asset('lib/assets/home1.jpeg', fit: BoxFit.cover),
//             const Positioned(bottom:5,left: 5, 
//             child:  Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Dreamsville House',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
//                 Text('TatiBazar, Old-Dhaka',style: TextStyle(fontSize: 12)),
//               ],
//             ))])),
//       ),
//     );
//   }
// }
