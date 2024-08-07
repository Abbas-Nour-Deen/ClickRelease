import 'package:choice/choice.dart';
import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/screens/selected_service_screen.dart';
import 'package:click_release/screens/allServices_screen.dart';
import 'package:click_release/widgets/public_widgets/loading_widgets/services_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesChipsWidget extends StatelessWidget {
  ServicesChipsWidget({super.key});

  final AllServicesController _servicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).services,
                style: Get.textTheme.titleLarge,
              ),
              InkWell(
                onTap: () => Get.to(AllServicesScreen(
                  servicesController: _servicesController,
                )),
                child: Text(
                  S.of(context).viewAll,
                  style: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _servicesController.obx(
              (state) => InlineChoice<ServiceModel>.single(
                  clearable: true,
                  value: null,
                  onChanged: (value) {
                    Get.to(SelectedServiceScreen(
                      service: value!,
                    ));
                    print("selected service ${value.nameEn}");
                  },
                  itemCount: 10,
                  itemBuilder: (state, i) {
                    return ChoiceChip(
                      showCheckmark: false,
                      selectedColor: Get.theme.colorScheme.onSecondaryContainer,
                      selected: state
                          .selected(_servicesController.shuffledServices[i]),
                      onSelected: state
                          .onSelected(_servicesController.shuffledServices[i]),
                      label: Text(_servicesController
                                  .localizationController.selectedLang.value ==
                              'en'
                          ? _servicesController.shuffledServices[i].nameEn
                          : _servicesController.shuffledServices[i].nameAr),
                      backgroundColor:
                          Get.theme.colorScheme.onSecondaryContainer,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      padding: const EdgeInsets.all(0),
                      elevation: 0,
                      labelStyle: Get.textTheme.labelMedium,
                      side: BorderSide.none,
                    );
                  },
                  listBuilder: ChoiceList.createWrapped(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 5,
                    runSpacing: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                  )),
              onLoading: const ServicesLoadingAnimations()),
        ],
      ),
    );
  }
}
