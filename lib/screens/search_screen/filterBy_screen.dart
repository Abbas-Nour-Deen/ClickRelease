import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/filterByWidgets/customeDropDown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterByScreen extends StatelessWidget {
  FilterByScreen({super.key});

  final SearchProviderController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(title: "Filter By"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<SearchProviderController>(
          id: "DropDowns",
          dispose: (state) => searchController.clearFiltrationData(),
          initState: (state) {
            searchController.searchProviders.clear();
            searchController.searchTextController.clear();
          },
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                CustomeDropDownWidget(
                  value: searchController.selectedCategoryForFilter,
                  onChanged: (p0) {
                    print(p0!.nameEn);
                    searchController.selectedCategoryForFilter = p0;
                    searchController.selectedServiceForFilter = null;
                    searchController.update(["DropDowns"]);
                  },
                  items: searchController.categoryControler.allCategories
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
                  visible: searchController.selectedCategoryForFilter == null
                      ? false
                      : true,
                  child: CustomeDropDownWidget(
                    value: searchController.selectedServiceForFilter,
                    onChanged: (p0) {
                      print(p0!.nameEn);
                      searchController.selectedServiceForFilter = p0;
                      searchController.update(["DropDowns"]);
                    },
                    items: searchController.servicesController.allServices
                        .where((element) =>
                            element.catId ==
                            searchController
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
                  value: searchController.selectedZoneForFilter,
                  onChanged: (p0) {
                    print(p0!.nameEng);
                    searchController.selectedZoneForFilter = p0;
                    searchController.update(["DropDowns"]);
                  },
                  items: searchController.zoneController.zones
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
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: searchController.obx((state) => ListView.builder(
            shrinkWrap: true,
            itemCount: searchController.searchProviders.length,
            itemBuilder: (context, index) => ProviderItem(
                margin: const EdgeInsets.only(bottom: 10),
                provider: searchController.searchProviders[index]),
          )),
    );
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
              searchController.onFilterSubmittied();
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
                value: searchController.selectedCategoryForFilter,
                items: searchController.categoryControler.allCategories
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
                  searchController.selectedCategoryForFilter = value;
                  searchController.update(["DropDowns"]);
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
                value: searchController.selectedRateForFilter,
                items: searchController.ratings
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
                  searchController.selectedRateForFilter = value;
                  searchController.update(["DropDowns"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
