import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProviderCategoryIcons extends StatelessWidget {
  final ProviderModel provider;
  ProviderCategoryIcons({super.key, required this.provider});

  final CategoryControler categoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.memory(
          categoriesController.allCategories
              .firstWhere(
                  (element) => element.nameEn == provider.categoryNameEng)
              .image,
          color: Get.theme.primaryColor,
          height: 14,
        ),
        const SizedBox(
          width: 7,
        ),
        SvgPicture.asset(
          "assets/icons/individual.svg",
          height: 14,
        )
      ],
    );
  }
}
