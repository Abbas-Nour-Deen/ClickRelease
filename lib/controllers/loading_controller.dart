import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  void showCustomeDialog(
      {required String type,
      required String title,
      required String body,
      required int duration}) {
    Get.snackbar(title, body,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: lightThemeDividerColor,
        duration: Duration(seconds: duration),
        forwardAnimationCurve: Curves.bounceIn,
        isDismissible: true,
        shouldIconPulse: true,
        icon: type == 'success'
            ? SvgPicture.asset("assets/icons/success.svg")
            : SvgPicture.asset("assets/icons/errorr.svg"),
        titleText: Text(
          title,
          style: Get.textTheme.titleMedium!
              .copyWith(color: type == 'success' ? Colors.green : Colors.red),
        ),
        messageText: Text(
          body,
          style: Get.textTheme.bodyMedium!
              .copyWith(color: lightTHemeSecondTextColor),
        ),
        dismissDirection: DismissDirection.horizontal,
        boxShadows: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ]);
  }
}
