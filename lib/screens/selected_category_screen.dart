import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/service_byID_controller.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/widgets/items/service_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/default_search_bar.dart';
import 'package:click_release/widgets/public_widgets/noenternet_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SelectedCategoryScreen extends StatelessWidget {
  final CategoryModel category;
  SelectedCategoryScreen({super.key, required this.category});

  final ServiceByIDController _serviceByIDController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          title: _serviceByIDController
                      .localizationController.selectedLang.value ==
                  'en'
              ? category.nameEn
              : category.nameAr),
      body: GetBuilder<ServiceByIDController>(
          id: 'catServices',
          dispose: (state) {
            _serviceByIDController.serviceByIDSearchController.clear();
          },
          initState: (state) async => await _serviceByIDController
              .getServiceByID(categoryID: category.categoryID),
          builder: (controller) => _serviceByIDController.obx(
                onLoading: Center(
                  child: Lottie.asset("assets/animations/ClickAnimation.json",
                      height: 250),
                ),
                (state) => Column(
                  children: [
                    DefaultSearchBar(
                      onChanged: (p0) {
                        _serviceByIDController.searchLogic(p0);
                      },
                      textController:
                          _serviceByIDController.serviceByIDSearchController,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _serviceByIDController
                                .serviceByIDSearchController.text.isEmpty
                            ? _serviceByIDController
                                .currentCategoryServices.length
                            : _serviceByIDController
                                .filteredCategoryServices.length,
                        itemBuilder: (context, index) {
                          return FadeInRight(
                              animate: true,
                              child: ServcieItem(
                                  service: _serviceByIDController
                                          .serviceByIDSearchController
                                          .text
                                          .isEmpty
                                      ? _serviceByIDController
                                          .currentCategoryServices[index]
                                      : _serviceByIDController
                                          .filteredCategoryServices[index]));
                        },
                      ),
                    ),
                  ],
                ),
                onError: (error) => NoEnternetPlaceHolder(
                  onretry: () async {
                    await _serviceByIDController.getServiceByID(
                        categoryID: category.categoryID);
                  },
                ),
              )),
    );
  }
}
