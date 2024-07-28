import 'package:click_release/controllers/review_controller.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_summary/rating_summary.dart';

class RatingSummaryWidget extends StatelessWidget {
  RatingSummaryWidget({
    super.key,
  });

  final ReviewsAndProjectController reviewsController = Get.find();

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
        counter: reviewsController.currentProviderReviews.length,
        average: reviewsController.average,
        showAverage: true,
        counterFiveStars: reviewsController.totalFiveStars,
        counterFourStars: reviewsController.totalFourStars,
        counterThreeStars: reviewsController.totalThreeStars,
        counterTwoStars: reviewsController.totalTwoStars,
        counterOneStars: reviewsController.totalOneStars,
        labelStyle: Get.textTheme.labelMedium!
            .copyWith(color: lightTHemeSecondTextColor),
      ),
    );
  }
}
