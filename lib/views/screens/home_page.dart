import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:house_rent/controller/baner_controller.dart';
import 'package:house_rent/controller/best_for_you_controller.dart';
import 'package:house_rent/controller/category_controller.dart';
import 'package:house_rent/controller/nearest_house_controller.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:house_rent/views/screens/details_page.dart';
import 'package:house_rent/views/screens/see_more.dart';
import 'package:house_rent/views/widgets/catagory_button.dart';
import 'package:house_rent/views/widgets/house_card_small.dart';
import 'package:parallax_cards/parallax_cards.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final List<String> imageList = [
    'lib/assets/home1.jpeg',
    'lib/assets/home1.jpeg',
    'lib/assets/home1.jpeg',
    'lib/assets/home1.jpeg',
    'lib/assets/home1.jpeg',
  ];

  final categoryController = Get.find<CategoryController>();
  final nearestHoueController = Get.find<NearestHoueController>();
  final best4uController = Get.find<BestForYouController>();
  final bannerController = Get.find<BanerController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: ListView(
        shrinkWrap: true,
        children: [
          _buildSearchField(),
          SizedBox(height: 10.h),
          _buildCategoryButtton(),
          SizedBox(height: 10.h),
          _buildSectionTitle('Near From you', 'grid', str: 'See more'),
          SizedBox(height: 10.h),
          //_buildHorizontalList(nearestHoueController),
          _buildHorizontaList(
             nearestHoueController.images, nearestHoueController.houseList),
          SizedBox(height: 10.h),
          _buildSectionTitle('Best for you', 'list', str: 'See more'),
          SizedBox(height: 10.h),
          _buildVerticleList(best4uController),
          SizedBox(height: 10.h),
          _buildSectionTitle('Villa you may like', 'list'),
          SizedBox(height: 10.h),
          _buildSlider(),
          SizedBox(height: 10.h),
          _buildSectionTitle(
            'you may like',
            'list',
          ),
          SizedBox(height: 10.h),
          _buildBannerList(bannerController),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Obx(
      () {
        return nearestHoueController.houseList.isEmpty
            ? const CircularProgressIndicator()
            : CarouselSlider.builder(
                itemCount: nearestHoueController.images.length,
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsPage(
                          houseModel: nearestHoueController.houseList[index]));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            nearestHoueController.images[index],
                            fit: BoxFit.cover,
                          )),
                    ),
                  );
                },
              );
      },
    );
  }

  Row _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 54,
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
        SizedBox(width: 8.55.w),
        Image.asset('lib/assets/filter_icon.png')
      ],
    );
  }

  Widget _buildCategoryButtton() {
    return SizedBox(
      height: 40.h,
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CatagoryButton(
                btnText: categoryController.categoryList[index],
                index: index,
              ),
            );
          },
          itemCount: categoryController.categoryList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

Row _buildSectionTitle(String title, String type, {String str = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
      ),
      InkWell(
        onTap: () {
          Get.to(() => SeeMorePage(type: type));
        },
        child: Text(
          str,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}

// Widget _buildHorizontalList(NearestHouseController controller) {
//   return FutureBuilder<List<CustomModel>>(
//     future: controller.getNearestHouses(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError) {
//         return Center(child: Text('Error: ${snapshot.error}'));
//       } else if (snapshot.hasData) {
//         List<CustomModel> houses = snapshot.data!;
//         List<String> imageList = controller.images;
//         return Stack(
//           children: [
//             ParallaxCards(
//               height: 300,
//               width: 230,
//               margin: const EdgeInsets.all(10),
//               imagesList: controller.images,
//               scrollDirection: Axis.horizontal,
//               onTap: (index) {
//                 Get.to(() => DetailsPage(houseModel: houses[index]));
//               },
//               overlays: [
//                 for (var house in houses)
//                   Positioned(
//                     bottom: 5,
//                     left: 5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(house.attributes!.houseTitle ?? 'Default',
//                             style: const TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w500)),
//                         Text(house.attributes!.location ?? 'Default',
//                             style: const TextStyle(fontSize: 12)),
//                       ],
//                     ),
//                   )
//               ],
//             ),
//           ],
//         );
//       } else {
//         return const Center(child: Text('No houses found'));
//       }
//     },
//   );
// }

Widget _buildHorizontaList(
    List<String> imageList, RxList<CustomModel> houselist) {
  return Obx(
    () => houselist.isEmpty
        ? const CircularProgressIndicator()
        : Stack(
            children: [
              ParallaxCards(
                height: 300,
                width: 230,
                margin: const EdgeInsets.all(10),
                imagesList: imageList,
                scrollDirection: Axis.horizontal,
                onTap: (index) {
                  Get.to(() => DetailsPage(houseModel: houselist[index]));
                },
                overlays: [
                  for (var title in houselist)
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title.attributes!.houseTitle ?? 'Default',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Text(title.attributes!.location ?? 'Default',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
  );
}

Widget _buildVerticleList(BestForYouController b4uController) {
  return Obx(
    () => ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: HouseCardSmall(houseModel: b4uController.houseList[index]),
        );
      },
      itemCount: b4uController.houseList.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
    ),
  );
}

Obx _buildBannerList(BanerController bannerController) {
  return Obx(
    () {
      return ListView.builder(
        itemCount: bannerController.bannerList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                //Get.to(DetailsPage(houseModel: ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    bannerController.bannerList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
