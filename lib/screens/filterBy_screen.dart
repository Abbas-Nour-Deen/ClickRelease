import 'package:click_release/controllers/filtration_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/category_model.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/models/zone_model.dart';
import 'package:click_release/widgets/items/provider_item.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/customeDropDown_widget.dart';
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
      bottomSheet: bottomSheet(context),
      appBar: CustomeAppBar(title: S.of(context).filterby),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<FiltrationController>(
          id: "DropDowns",
          dispose: (state) => filtrationController.clearFiltrationData(),
          builder: (controller) => SingleChildScrollView(
            // controller: filtrationController.scrolController,
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
                                  filtrationController.localizationController
                                              .selectedLang.value ==
                                          'en'
                                      ? e.nameEn
                                      : e.nameAr,
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
                  title: S.of(context).categories,
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
                                    filtrationController.localizationController
                                                .selectedLang.value ==
                                            'en'
                                        ? e.nameEn
                                        : e.nameAr,
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
                    title: S.of(context).services,
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
                                  filtrationController.localizationController
                                              .selectedLang.value ==
                                          'en'
                                      ? e.nameEng
                                      : e.nameArb,
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
                  title: S.of(context).zone,
                ),
                ratingDropDown(context),
                filtrationResult(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filtrationResult(context) {
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
                    "${filtrationController.filterProviders.length} ${S.of(context).resultsFound}",
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
            onEmpty: Container(
              margin: const EdgeInsets.only(bottom: 90),
              child: Column(
                children: [
                  SizedBox(
                      height: 300,
                      child: SvgPicture.asset("assets/filter_empty.svg")),
                  Text(
                    S.of(context).Noresultsmatchyourfilters,
                    style: Get.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    S.of(context).Adjustyourfilters,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            onLoading: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            onError: (error) => Text(error.toString()),
          )
        : const SizedBox.shrink());
  }

  Widget bottomSheet(context) {
    return CustomeButtomSheet(
      childrens: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              S.of(context).cancel,
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
            text: S.of(context).search,
          ),
        ),
      ],
    );
  }

  Widget ratingDropDown(context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).rate,
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
                  S.of(context).select,
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
