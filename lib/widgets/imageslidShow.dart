import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class ImageSlideShowWidget extends StatelessWidget {
  const ImageSlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: ImageSlideshow(
        disableUserScrolling: false,
        initialPage: 0,
        isLoop: true,
        indicatorBottomPadding: 0,
        indicatorPadding: 6,
        indicatorColor: Get.theme.primaryColor,
        autoPlayInterval: 3000,
        indicatorRadius: 4,
        children: [
          Image.asset("assets/images/slideimage.png"),
          Image.asset("assets/images/slideimage.png"),
          Image.asset("assets/images/slideimage.png"),
        ],
      ),
    );
  }
}
