import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/controller/category_controller.dart';

class CatagoryButton extends StatelessWidget {
  final String btnText;
  final int index;
  CatagoryButton({required this.btnText, required this.index, super.key});
  CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onCategorySelected(index);
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue, width: 1),
            gradient: controller.selectedIndex.value   == index
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color.fromARGB(255, 160, 218, 251),
                        Color.fromARGB(255, 10, 142, 217),
                      ])
                : null
          ),  
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Center(
              child: Text(
                btnText,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         style: TextButton.styleFrom(foregroundColor: Colors.white),
//         onPressed: () {},
//         child: Ink(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               gradient: const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color.fromARGB(255, 160, 218, 251),
//                     Color.fromARGB(255, 10, 142, 217),
//                   ]),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 'ApartMent',
//               ),
//             )));
//   }
// }
