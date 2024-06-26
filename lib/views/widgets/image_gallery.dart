import 'package:flutter/material.dart';
import 'package:house_rent/data/model/custom_model.dart';
import 'package:photo_view/photo_view_gallery.dart';
class GalleryPage extends StatelessWidget {
  final CustomModel houseModel;
  final int initialIndex;
  const GalleryPage({required this.houseModel, required this.initialIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: PhotoViewGallery.builder(
          itemCount: houseModel.attributes?.images?.data?.length ?? 0,
          pageController: PageController(initialPage: initialIndex),
          builder: (context, index) {
            final imageUrl = 'http://192.168.185.124:1337${houseModel.attributes?.images?.data?[index].attributes?.url}';
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imageUrl),
              //minScale: PhotoViewComputedScale.contained,
              //maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          loadingBuilder: (context, event) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}