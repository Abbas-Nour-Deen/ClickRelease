import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:click_release/controllers/review_controller.dart';
import 'package:click_release/models/review_model.dart';
import 'package:click_release/screens/provider_screens/reviews_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/selected_provider_widgets/stars_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  ReviewItem({
    super.key,
    required this.review,
  });

  final ReviewsController reviewsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Get.to(RatingAndReviewsScreen(
              reviews: reviewsController.currentProviderReviews));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            const SizedBox(
              height: 6,
            ),
            rating(),
            const SizedBox(
              height: 9,
            ),
            content()
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: lightThemeDividerColor,
                    borderRadius: BorderRadius.circular(100)),
                child:
                    review.profilePhoto == null || review.profilePhoto.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SvgPicture.asset(
                                "assets/images/person.svg",
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              review.profilePhoto,
                              fit: BoxFit.cover,
                            ),
                          )),
            const SizedBox(
              width: 8,
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
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:
          Get.textTheme.bodyMedium!.copyWith(color: lightTHemeSecondTextColor),
    );
  }
}
