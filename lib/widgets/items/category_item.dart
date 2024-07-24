import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/screens/selected_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  CategoryItem({super.key, required this.category});

  final LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => Get.to(SelectedCategoryScreen(
          category: category,
        )),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Get.theme.colorScheme.onSecondaryContainer),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: category.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 90,
              child: AutoSizeText(
                localizationController.selectedLang.value == 'en'
                    ? category.nameEn
                    : category.nameAr,
                textAlign: TextAlign.center,
                minFontSize: 9,
                softWrap: true,
                wrapWords: true,
                maxLines: 2,
                style: Get.textTheme.labelMedium,
                overflow: TextOverflow.clip,
              ),
            )
          ],
        ),
      ),
    );
  }
}
