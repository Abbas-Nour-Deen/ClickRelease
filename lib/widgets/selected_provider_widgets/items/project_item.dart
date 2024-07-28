import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectItem extends StatelessWidget {
  final String imageURL;
  const ProjectItem({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          showImageViewer(context, NetworkImage(imageURL),
              doubleTapZoomable: true,
              immersive: false,
              useSafeArea: true,
              swipeDismissible: true,
              closeButtonColor: Get.theme.primaryColor);
        },
        child: CachedNetworkImage(
          imageUrl: imageURL,
          placeholder: (context, url) => const SizedBox(
            height: 20,
          ),
        ),
      ),
    );
  }
}
