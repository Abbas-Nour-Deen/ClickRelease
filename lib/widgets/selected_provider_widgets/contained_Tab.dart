import 'package:click_release/controllers/review_controller.dart';
import 'package:click_release/screens/provider_screens/reviews_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/post_item.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/project_item.dart';
import 'package:click_release/widgets/selected_provider_widgets/items/review_item.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(8.0),
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
        tabs: const [
          // Text('Posts'),
          Text('Reviews'),
          Text('Projects'),
        ],
        views: [reviewsContent(), projectContent()],
        onChange: (index) => print(index),
      ),
    );
  }

  Widget reviewsContent() {
    return reviewsController.obx(
        (state) => Container(
              padding: const EdgeInsets.all(10),
              color: Get.theme.colorScheme.onSecondaryContainer,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${reviewsController.currentProviderReviews.length} Reviews",
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: lightTHemeSecondTextColor),
                      ),
                      InkWell(
                        onTap: () => Get.to(RatingAndReviewsScreen(
                          reviews: reviewsController.currentProviderReviews,
                        )),
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
        onEmpty: const Center(
          child: Text("No reviews yet !"),
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

  Widget projectContent() {
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
                  "${reviewsController.projectsController.currentProviderProjects.length} Projects",
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
      onEmpty: const Center(
        child: Text("No Projects Found!"),
      ),
      onError: (error) => const Center(
        child: Text("No Projects Found!"),
      ),
    );
  }
}
