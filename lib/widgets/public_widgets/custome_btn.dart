import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeButton extends StatelessWidget {
  final SvgPicture? svg;
  final Icon? icon;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Function()? ontap;
  final EdgeInsets? margin;
  final Color? color;
  const CustomeButton(
      {super.key,
      required this.text,
      this.icon,
      this.svg,
      this.width,
      this.height,
      this.ontap,
      this.margin,
      this.color,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      width: width ?? 100,
      height: height ?? 120,
      decoration: BoxDecoration(
          color: color ?? Get.theme.primaryColor,
          borderRadius: BorderRadius.circular(3)),
      child: InkWell(
        onTap: ontap,
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            svg ?? Container(),
            icon != null
                ? const SizedBox(
                    width: 6,
                  )
                : Container(),
            Text(
              text,
              style: textStyle ??
                  Get.textTheme.titleLarge!.copyWith(
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
