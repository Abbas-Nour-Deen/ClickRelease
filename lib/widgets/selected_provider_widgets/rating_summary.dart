import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_summary/rating_summary.dart';

class RatingSummaryWidget extends StatelessWidget {
  const RatingSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: lightThemeDividerColor))),
      child: RatingSummary(
        color: Get.theme.primaryColor,
        counter: 12,
        average: 3.846,
        showAverage: true,
        counterFiveStars: 10,
        counterFourStars: 7,
        counterThreeStars: 5,
        counterTwoStars: 4,
        counterOneStars: 1,
        labelStyle: Get.textTheme.labelMedium!
            .copyWith(color: lightTHemeSecondTextColor),
      ),
    );
  }
}
