import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeButton extends StatelessWidget {
  final Icon? icon;
  final String text;
  final double? width;
  final double? height;
  final Function()? ontap;
  final EdgeInsets? margin;
  const CustomeButton(
      {super.key,
      required this.text,
      this.icon,
      this.width,
      this.height,
      this.ontap,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      width: width ?? 100,
      height: height ?? 120,
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(3)),
      child: InkWell(
        onTap: ontap,
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: Get.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
