import 'package:cached_network_image/cached_network_image.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/screens/allCategories_screens/selected_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(SelectedCategoryScreen(
        category: category,
      )),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 80,
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Get.theme.colorScheme.onSecondaryContainer),
              child: Center(
                child: CachedNetworkImage(imageUrl: category.image),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Text(
              category.nameEn,
              textAlign: TextAlign.center,
              style: Get.textTheme.labelMedium,
            ))
          ],
        ),
      ),
    );
  }
}
