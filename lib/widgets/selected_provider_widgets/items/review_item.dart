import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/models/review_model.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/selected_provider_widgets/stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          const SizedBox(
            height: 7,
          ),
          rating(),
          const SizedBox(
            height: 7,
          ),
          content()
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/me.jpeg",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              review.clientUsername,
              style: Get.textTheme.labelMedium!
                  .copyWith(color: lightTHemeSecondTextColor),
            )
          ],
        ),
        // Text(
        //   "2 hours ago",
        //   style: Get.textTheme.labelMedium!
        //       .copyWith(color: lightTHemeSecondTextColor),
        // )
      ],
    );
  }

  Widget rating() {
    return Row(
      children: [
        StarsWidget(rateValue: review.rate),
        const SizedBox(
          width: 2,
        ),
        Text(
          review.rate.toString(),
          style: Get.textTheme.labelMedium,
        )
      ],
    );
  }

  Widget content() {
    return AutoSizeText(
      review.comment,
      maxLines: 3,
      style:
          Get.textTheme.bodyMedium!.copyWith(color: lightTHemeSecondTextColor),
    );
  }
}
