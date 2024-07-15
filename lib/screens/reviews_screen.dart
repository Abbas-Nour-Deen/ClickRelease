import 'package:click_release/models/review_model.dart';
import 'package:click_release/screens/add_review_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/selected_provider_widgets/rating_summary.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/review_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingAndReviewsScreen extends StatelessWidget {
  final List<ReviewModel> reviews;
  const RatingAndReviewsScreen({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: bottomSheet(),
        appBar: CustomeAppBar(title: "Reviews"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                RatingSummaryWidget(),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(
                      reviews
                          .where(
                            (element) => element.comment.isNotEmpty,
                          )
                          .length,
                      (index) => Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: lightThemeDividerColor))),
                          child: ReviewItem(
                            review: reviews[index],
                          ))),
                ),
                SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
        ));
  }

  Widget bottomSheet() {
    return CustomeButtomSheet(
      childrens: [
        Expanded(
          child: CustomeButton(
            ontap: () {
              Get.to(AddReviewScreen());
            },
            text: "Leave Review",
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
