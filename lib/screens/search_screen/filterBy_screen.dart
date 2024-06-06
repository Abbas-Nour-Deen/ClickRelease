import 'package:click_release/controllers/filtration_controller.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/filterByWidgets/customeDropDown_widget.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterByScreen extends StatelessWidget {
  FilterByScreen({super.key});

  final FiltrationController filtrationController =
      Get.put(FiltrationController(dataRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(title: "Filter By"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<FiltrationController>(
          id: "DropDowns",
          dispose: (state) => filtrationController.clearFiltrationData(),
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                CustomeDropDownWidget(
                  value: filtrationController.selectedCategoryForFilter,
                  onChanged: (p0) {
                    print(p0!.nameEn);
                    filtrationController.selectedCategoryForFilter = p0;
                    filtrationController.selectedServiceForFilter = null;
                    filtrationController.update(["DropDowns"]);
                  },
                  items: filtrationController.categoryControler.allCategories
                      .map((e) => DropdownMenuItem<CategoryModel>(
                            value: e,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.nameEn,
                                  style: Get.textTheme.bodyMedium,
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  title: "Category",
                ),
                Visibility(
                  visible:
                      filtrationController.selectedCategoryForFilter == null
                          ? false
                          : true,
                  child: CustomeDropDownWidget(
                    value: filtrationController.selectedServiceForFilter,
                    onChanged: (p0) {
                      print(p0!.nameEn);
                      filtrationController.selectedServiceForFilter = p0;
                      filtrationController.update(["DropDowns"]);
                    },
                    items: filtrationController.servicesController.allServices
                        .where((element) =>
                            element.catId ==
                            filtrationController
                                .selectedCategoryForFilter?.categoryID)
                        .map((e) => DropdownMenuItem<ServiceModel>(
                              value: e,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.nameEn,
                                    style: Get.textTheme.bodyMedium,
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                    title: "Service",
                  ),
                ),
                CustomeDropDownWidget(
                  value: filtrationController.selectedZoneForFilter,
                  onChanged: (p0) {
                    print(p0!.nameEng);
                    filtrationController.selectedZoneForFilter = p0;
                    filtrationController.update(["DropDowns"]);
                  },
                  items: filtrationController.zoneController.zones
                      .map((e) => DropdownMenuItem<ZoneModel>(
                            value: e,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.nameEng,
                                  style: Get.textTheme.bodyMedium,
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  title: "Zone",
                ),
                ratingDropDown(),
                filtrationResult()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filtrationResult() {
    return Obx(() => filtrationController.isFilterLoading.value
        ? filtrationController.obx(
            (state) => Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomeDivider(
                    height: 0.7,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${filtrationController.filterProviders.length} results found",
                    style: Get.textTheme.labelSmall!.copyWith(fontSize: 11),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtrationController.filterProviders.length,
                      itemBuilder: (context, index) => ProviderItem(
                          margin: const EdgeInsets.only(bottom: 10),
                          provider:
                              filtrationController.filterProviders[index]),
                    ),
                  )
                ],
              ),
            ),
            onEmpty: const Center(
              child: Text("No results found"),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            onError: (error) => Text(error.toString()),
          )
        : const SizedBox.shrink());
  }

  Widget bottomSheet() {
    return CustomeButtomSheet(
      childrens: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: Get.textTheme.labelLarge,
            )),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: CustomeButton(
            ontap: () {
              filtrationController.onFilterSubmittied();
            },
            text: "Click",
          ),
        ),
      ],
    );
  }

  Widget categoryDropDown() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            decoration: customContainerDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CategoryModel>(
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                isExpanded: true,
                elevation: 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                underline: Container(),
                hint: Text(
                  'Select',
                  style: Get.textTheme.bodyMedium,
                ),
                value: filtrationController.selectedCategoryForFilter,
                items: filtrationController.categoryControler.allCategories
                    .map((e) => DropdownMenuItem<CategoryModel>(
                          value: e,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.nameEn,
                                style: Get.textTheme.bodyMedium,
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 1,
                              )
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  filtrationController.selectedCategoryForFilter = value;
                  filtrationController.update(["DropDowns"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingDropDown() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rate",
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            decoration: customContainerDecoration(),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                dropdownColor: Get.theme.colorScheme.primaryContainer,
                isExpanded: true,
                elevation: 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                underline: Container(),
                hint: Text(
                  'Select',
                  style: Get.textTheme.bodyMedium,
                ),
                value: filtrationController.selectedRateForFilter,
                items: filtrationController.ratings
                    .map((e) => DropdownMenuItem<int>(
                        value: e,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(e.toString()),
                                const SizedBox(
                                  width: 3,
                                ),
                                for (int i = 0; i < e; i++)
                                  SvgPicture.asset(
                                      "assets/icons/lightheme_icons/star.svg")
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                            )
                          ],
                        )))
                    .toList(),
                onChanged: (value) {
                  filtrationController.selectedRateForFilter = value;
                  filtrationController.update(["DropDowns"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
