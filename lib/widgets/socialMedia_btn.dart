import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SocialMediaButtom extends StatelessWidget {
  final String svgPath;
  final Function() onTap;
  const SocialMediaButtom(
      {super.key, required this.svgPath, required this.onTap});

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
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: SvgPicture.asset(svgPath),
        ),
      ),
    );
  }
}
