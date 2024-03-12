import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SocialMediaButtom extends StatelessWidget {
  final String svgPath;
  const SocialMediaButtom({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.onSecondaryContainer,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: SvgPicture.asset(svgPath),
      ),
    );
  }
}
