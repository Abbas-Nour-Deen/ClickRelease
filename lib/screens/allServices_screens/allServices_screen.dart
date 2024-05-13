import 'package:click_release/controllers/categories_controller.dart';
import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/screens/allServices_screens/widgets/service_expansion_widget.dart';
import 'package:click_release/widgets/items/service_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:click_release/widgets/public_widgets/default_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesScreen extends StatelessWidget {
  final AllServicesController servicesController;
  AllServicesScreen({super.key, required this.servicesController});

  final CategoryControler _categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(
          title: "Services",
        ),
        body: ListView(children: [
          const DefaultSearchBar(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                  children: List.generate(
                      _categoryController.allCategories.length,
                      (index) => Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            color: Get.theme.colorScheme.primaryContainer,
                            child: ServiceExpansionWidget(
                                title: _categoryController
                                    .allCategories[index].nameEn,
                                content: Container(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      servicesController.allServices
                                          .where((element) =>
                                              element.catId ==
                                              _categoryController
                                                  .allCategories[index]
                                                  .categoryID)
                                          .length,
                                      (index2) => Column(
                                        children: [
                                          ServcieItem(
                                            service: servicesController
                                                .allServices
                                                .where((element) =>
                                                    element.catId ==
                                                    _categoryController
                                                        .allCategories[index]
                                                        .categoryID)
                                                .toList()[index2],
                                          ),
                                          const CustomeDivider(
                                            height: 1,
                                          )
                                        ],
                                      ),
                                    ).toList(),
                                  ),
                                )),
                          )))),
        ]));
  }
}
