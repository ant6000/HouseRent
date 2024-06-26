import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/core/helper/url_launcer.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerContact extends StatelessWidget {
  final CustomModel houseModel;
  const OwnerContact({required this.houseModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.grey,
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Image.asset(
                    'lib/assets/profile_pic1.png',
                  )),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(houseModel.attributes?.ownerName ?? '',
                    style: TextStyle(
                        fontSize: 17.sp, fontWeight: FontWeight.w500)),
                Text('Owner',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('tel:${houseModel.attributes?.ownerPhone}');
                  await launchUrl(url,);
                },
                child: Image.asset('lib/assets/IC_Phone.png')),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () => Fluttertoast.showToast(
                    msg: "Comming Soon",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0),
                child: Image.asset('lib/assets/IC_Message.png')),
          ],
        )
      ],
    );
  }
}
