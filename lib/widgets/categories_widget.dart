import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/allcategories_screen.dart';
import 'package:click_release/widgets/items/category_item.dart';
import 'package:click_release/widgets/public_widgets/loading_widgets/categories_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key});

  final CategoryControler categoryControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).categories,
                style: Get.textTheme.titleLarge,
              ),
              InkWell(
                onTap: () => Get.to(AllCategoriesScreen()),
                child: Text(
                  S.of(context).viewAll,
                  style: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
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
                itemCount: categoryControler.allCategories.length - 5,
                itemBuilder: (context, index) {
                  return FadeInRight(
                      animate: true,
                      child: CategoryItem(
                        category: categoryControler.allCategories[index],
                      ));
                },
              ),
            ),
            onLoading: const CategoriesLoadingAnimation(),
            onError: (error) => Text(error.toString()),
          )
        ],
      ),
    );
  }
}
