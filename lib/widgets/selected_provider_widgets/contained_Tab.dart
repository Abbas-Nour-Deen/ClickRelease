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
  const ContainedTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 420,
      child: ContainedTabBarView(
        initialIndex: 1,
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
          Text('Posts'),
          Text('Reviews'),
          Text('Projects'),
        ],
        views: [postsContent(), reviewsContent(), projectContent()],
        onChange: (index) => print(index),
      ),
    );
  }

  Widget reviewsContent() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Get.theme.colorScheme.onSecondaryContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12 Reviews",
                style: Get.textTheme.labelMedium!
                    .copyWith(color: lightTHemeSecondTextColor),
              ),
              InkWell(
                onTap: () => Get.to(RatingAndReviewsScreen()),
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
          ReviewItem(),
          ReviewItem()
        ],
      ),
    );
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
    return Container(
      padding: const EdgeInsets.all(10),
      color: Get.theme.colorScheme.onSecondaryContainer,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "20 Projects",
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
              itemCount: 6,
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              builder: (context, index) {
                return ProjectItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
