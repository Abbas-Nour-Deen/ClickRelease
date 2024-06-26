import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/category_item.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});
  final CategoryControler categoryControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: S.of(context).categories),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DynamicHeightGridView(
              builder: (context, index) {
                return CategoryItem(
                  category: categoryControler.allCategories[index],
                );
              },
              itemCount: categoryControler.allCategories.length,
              crossAxisCount: 4)),
    );
  }
}
