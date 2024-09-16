import 'package:click_release/controllers/review_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/reviews_screen.dart';
import 'package:click_release/theme/app_theme.dart';
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
  final ReviewsAndProjectController reviewsController =
      Get.put(ReviewsAndProjectController(dataRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewsAndProjectController>(
      id: 'containedTab',
      builder: (controller) {
        // final bool isLoading = reviewsController.isReviewsDataLoading &&
        //     reviewsController.isprojectsDataLoading;
        bool hasReviews = reviewsController.currentProviderReviews.isNotEmpty;

        if (hasReviews) {
          bool hasComments = reviewsController.currentProviderReviews.any(
            (element) => element.comment.isNotEmpty && element.comment != '',
          );
          if (hasComments) {
            hasReviews = true;
          } else {
            hasReviews = false;
          }
        }
        final bool hasProjects =
            reviewsController.currentProviderProjects != null &&
                reviewsController.currentProviderProjects!.imageUrl.isNotEmpty;

        List<Widget> tabs = [];
        List<Widget> views = [];
        int initialIndex = 0;

        if (reviewsController.isDataLoading) {
          return Container();
        }

        if (hasReviews && hasProjects) {
          tabs = [
            Text(S.of(context).reviews),
            Text(S.of(context).portfolio),
          ];
          views = [
            reviewsContent(context: context),
            projectContent(context: context),
          ];
        } else if (hasReviews) {
          tabs = [Text(S.of(context).reviews)];
          views = [reviewsContent(context: context)];
        } else if (hasProjects) {
          tabs = [Text(S.of(context).projects)];
          views = [projectContent(context: context)];
        } else {
          return Container();
        }

        if (tabs.isNotEmpty && initialIndex >= tabs.length) {
          initialIndex = 0;
        }

        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(5.0),
          width: double.infinity,
          height: 400,
          child: ContainedTabBarView(
            initialIndex: initialIndex,
            tabBarProperties: TabBarProperties(
              labelStyle: Get.textTheme.titleSmall,
              unselectedLabelColor: Colors.black,
              labelColor: Get.theme.primaryColor,
              background: Container(
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: Get.theme.primaryColor,
                  ),
                ),
              ),
            ),
            tabs: tabs,
            views: views,
            onChange: (index) => print(index),
          ),
        );
      },
    );
  }

  Widget reviewsContent({required BuildContext context}) {
    return Container(
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
                "${reviewsController.currentProviderReviews.where(
                      (element) => element.comment.isNotEmpty,
                    ).length} ${S.of(context).reviews}",
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
                reviewsController.currentProviderReviews
                            .where(
                              (element) => element.comment.isNotEmpty,
                            )
                            .length >
                        2
                    ? 2
                    : reviewsController.currentProviderReviews
                        .where(
                          (element) => element.comment.isNotEmpty,
                        )
                        .length, (index) {
              return ReviewItem(
                review: reviewsController.currentProviderReviews[index],
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // Widget postsContent() {
  //   return Container(
  //     padding: const EdgeInsets.all(10),
  //     color: Get.theme.colorScheme.onSecondaryContainer,
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "5 Posts",
  //               style: Get.textTheme.labelMedium!
  //                   .copyWith(color: lightTHemeSecondTextColor),
  //             ),
  //             InkWell(
  //               onTap: () {},
  //               child: Text(
  //                 "View All",
  //                 style: Get.textTheme.labelMedium!
  //                     .copyWith(color: lightTHemeSecondTextColor),
  //               ),
  //             )
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         PostItem(),
  //         PostItem()
  //       ],
  //     ),
  //   );
  // }

  Widget projectContent({required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Get.theme.colorScheme.onSecondaryContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${reviewsController.currentProviderProjects!.imageUrl.length} ${S.of(context).projects}",
                style: Get.textTheme.labelMedium!
                    .copyWith(color: lightTHemeSecondTextColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: DynamicHeightGridView(
              itemCount:
                  reviewsController.currentProviderProjects!.imageUrl.length > 6
                      ? 6
                      : reviewsController
                          .currentProviderProjects!.imageUrl.length,
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              builder: (context, index) {
                return ProjectItem(
                  imageURL: reviewsController
                      .currentProviderProjects!.imageUrl[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
