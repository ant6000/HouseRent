import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/data/repository/get_location.dart';
import 'package:house_rent/views/widgets/image_gallery.dart';
import 'package:house_rent/views/widgets/owner_contact.dart';

class DetailsPage extends StatefulWidget {
  final CustomModel houseModel;
  DetailsPage({required this.houseModel, super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    getCoordinates('39 radhika mohon boask lane');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'http://192.168.185.124:1337${widget.houseModel.attributes?.images?.data?[0].attributes?.url}',
                      height: 340.h,
                      width: 360.w,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black.withOpacity(0.2),
                          child: Image.asset('lib/assets/IC_Back.png'),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        child: Image.asset('lib/assets/IC_Bookmark.png'),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            widget.houseModel.attributes!.houseTitle.toString(),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        SizedBox(height: 8.h),
                        Text(widget.houseModel.attributes!.location.toString(),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Image.asset('lib/assets/IC_Bed.png',
                                color: Colors.white),
                            SizedBox(width: 8.w),
                            Text('${widget.houseModel.attributes!.bed} Bed',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(width: 20.w),
                            Image.asset('lib/assets/IC_Bath.png',
                                color: Colors.white),
                            SizedBox(width: 8.w),
                            Text('${widget.houseModel.attributes!.bed} Bath',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(width: 8.w),
                            const Icon(Icons.kitchen, size: 18),
                            SizedBox(width: 8.w),
                            Text(
                                '${widget.houseModel.attributes!.kitchen} Kitch.',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Text('Description',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 10.h),
            Text(
                widget.houseModel.attributes?.description?[0].children[0]
                        .text ??
                    '',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 10.h),
            OwnerContact(
              houseModel: widget.houseModel,
            ),
            SizedBox(height: 20.h),
            Text('Gallery',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
            SizedBox(
              height: 100.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    widget.houseModel.attributes?.images?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final imageUrl =
                      'http://192.168.185.124:1337${widget.houseModel.attributes?.images?.data?[index].attributes?.url}';
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => GalleryPage(
                          houseModel: widget.houseModel, initialIndex: index));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          imageUrl,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: GoogleMap(
                      initialCameraPosition: DetailsPage._kGooglePlex,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      scrollGesturesEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      gestureRecognizers: {
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      },
                    ))),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price',
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w400)),
                    SizedBox(height: 5.h),
                    Text('${widget.houseModel.attributes!.price}Tk / Mo',
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('Rent Now'))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
