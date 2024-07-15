import 'package:cached_network_image/cached_network_image.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class ImageSlideShowWidget extends StatelessWidget {
  ImageSlideShowWidget({super.key});

  final ProviderController providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: GetBuilder<ProviderController>(
        id: "slider",
        builder: (controller) => ImageSlideshow(
          disableUserScrolling: false,
          initialPage: 0,
          isLoop: true,
          indicatorBottomPadding: 0,
          indicatorPadding: 6,
          indicatorColor: Get.theme.primaryColor,
          autoPlayInterval: 3000,
          indicatorRadius: 4,
          children: providerController.sliderImages.isEmpty
              ? [Image.asset("assets/images/clickLogo.png")]
              : providerController.sliderImages
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Image.asset("assets/images/clickLogo.png");
                      },
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
