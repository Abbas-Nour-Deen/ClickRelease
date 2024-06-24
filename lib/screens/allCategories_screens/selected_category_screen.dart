import 'package:click_release/controllers/service_byID_controller.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/widgets/items/service_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/default_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedCategoryScreen extends StatelessWidget {
  final CategoryModel category;
  SelectedCategoryScreen({super.key, required this.category});

  final ServiceByIDController _serviceByIDController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: category.nameEn),
      body: Column(
        children: [
          DefaultSearchBar(),
          GetBuilder<ServiceByIDController>(
              initState: (state) async => await _serviceByIDController
                  .getServiceByID(categoryID: category.categoryID),
              builder: (controller) =>
                  _serviceByIDController.obx((state) => Expanded(
                        child: ListView.builder(
                          itemCount: _serviceByIDController
                              .currentCategoryServices.length,
                          itemBuilder: (context, index) {
                            return ServcieItem(
                              service: _serviceByIDController
                                  .currentCategoryServices[index],
                            );
                          },
                        ),
                      )))
        ],
      ),
    );
  }
}
