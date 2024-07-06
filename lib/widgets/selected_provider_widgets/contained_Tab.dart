import 'package:click_release/controllers/review_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/reviews_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/post_item.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/project_item.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/review_item.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContainedTabWidget extends StatelessWidget {
  ContainedTabWidget({
    super.key,
  });
  final ReviewsController reviewsController =
      Get.put(ReviewsController(dataRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5.0),
      width: double.infinity,
      height: 400,
      child: ContainedTabBarView(
        initialIndex: 0,
        tabBarProperties: TabBarProperties(
            labelStyle: Get.textTheme.titleSmall,
            unselectedLabelColor: Colors.black,
            labelColor: Get.theme.primaryColor,
            background: Container(
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(5)),
            ),
            indicator: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                width: 3,
                color: Get.theme.primaryColor,
              ),
            ))),
        tabs: [
          // Text('Posts'),
          Text(S.of(context).reviews),
          Text(S.of(context).projects),
        ],
        views: [
          reviewsContent(context: context),
          projectContent(context: context)
        ],
        onChange: (index) => print(index),
      ),
    );
  }

  Widget reviewsContent({required BuildContext context}) {
    return reviewsController.obx(
        (state) => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onSecondaryContainer,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${reviewsController.currentProviderReviews.length} ${S.of(context).reviews}",
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: lightTHemeSecondTextColor),
                      ),
                      InkWell(
                        onTap: () => Get.to(RatingAndReviewsScreen(
                          reviews: reviewsController.currentProviderReviews,
                        )),
                        child: Text(
                          S.of(context).viewAll,
                          style: Get.textTheme.labelMedium!
                              .copyWith(color: lightTHemeSecondTextColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        reviewsController.currentProviderReviews.length > 2
                            ? 2
                            : reviewsController.currentProviderReviews.length,
                        (index) {
                      return ReviewItem(
                        review: reviewsController.currentProviderReviews[index],
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
        onEmpty: Center(
          child: Text(S.of(context).noreviewsyet),
        ));
  }

  Widget postsContent() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Get.theme.colorScheme.onSecondaryContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "5 Posts",
                style: Get.textTheme.labelMedium!
                    .copyWith(color: lightTHemeSecondTextColor),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "View All",
                  style: Get.textTheme.labelMedium!
                      .copyWith(color: lightTHemeSecondTextColor),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          PostItem(),
          PostItem()
        ],
      ),
    );
  }

  Widget projectContent({required BuildContext context}) {
    return reviewsController.projectsController.obx(
      (state) => Container(
        padding: const EdgeInsets.all(10),
        color: Get.theme.colorScheme.onSecondaryContainer,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${reviewsController.projectsController.currentProviderProjects.length} ${S.of(context).projects}",
                  style: Get.textTheme.labelMedium!
                      .copyWith(color: lightTHemeSecondTextColor),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: Get.textTheme.labelMedium!
                        .copyWith(color: lightTHemeSecondTextColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: DynamicHeightGridView(
                itemCount: reviewsController
                            .projectsController.currentProviderProjects.length >
                        6
                    ? 6
                    : reviewsController
                        .projectsController.currentProviderProjects.length,
                crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                builder: (context, index) {
                  return ProjectItem(
                    projectModel: reviewsController
                        .projectsController.currentProviderProjects[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
      onEmpty: Center(
        child: Text(S.of(context).NoProjectsyet),
      ),
      onError: (error) => Center(
        child: Text(S.of(context).NoProjectsyet),
      ),
    );
  }
}
