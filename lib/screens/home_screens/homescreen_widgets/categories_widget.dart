import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/screens/allCategories_screens/allcategories_screen.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/category_item.dart';
import 'package:click_release/widgets/public_widgets/loading_widgets/categories_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key});

  final CategoryControler categoryControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: Get.textTheme.titleLarge,
              ),
              InkWell(
                onTap: () => Get.to(AllCategoriesScreen()),
                child: Text(
                  "View all",
                  style: Get.textTheme.labelMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          categoryControler.obx(
            (state) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryControler.allCategories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    category: categoryControler.allCategories[index],
                  );
                },
              ),
            ),
            onLoading: CategoriesLoadingAnimation(),
            onError: (error) => Text(error.toString()),
          )
        ],
      ),
    );
  }
}
