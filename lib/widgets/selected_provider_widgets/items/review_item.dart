import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/selected_provider_widgets/stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

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
              "Abbas Nour Deen",
              style: Get.textTheme.labelMedium!
                  .copyWith(color: lightTHemeSecondTextColor),
            )
          ],
        ),
        Text(
          "2 hours ago",
          style: Get.textTheme.labelMedium!
              .copyWith(color: lightTHemeSecondTextColor),
        )
      ],
    );
  }

  Widget rating() {
    return Row(
      children: [
        const StarsWidget(rateValue: 3.5),
        const SizedBox(
          width: 2,
        ),
        Text(
          "3.5",
          style: Get.textTheme.labelMedium,
        )
      ],
    );
  }

  Widget content() {
    return AutoSizeText(
      "Lorem ipsum dolor sit amet consectetur. Dictum amet duis imperdiet risus vulputate massa aasdbasdasdsdbbbbfasdasdasdasdaspyasdajshdjasdhjasdeasjdhasdjasdqc.",
      maxLines: 3,
      style:
          Get.textTheme.bodyMedium!.copyWith(color: lightTHemeSecondTextColor),
    );
  }
}
