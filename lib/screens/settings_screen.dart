import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: S.of(context).settings),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).language,
                  style: Get.textTheme.titleSmall,
                ),
                languageDropDown()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget languageDropDown() {
    return DropdownButton2(
        underline: Container(),
        value: localizationController.selectedLang.value == 'en' ? 0 : 1,
        onChanged: (value) {
          localizationController.changeLanguage(value!);
        },
        items: [
          DropdownMenuItem(
              value: 0,
              child: Text(
                S.of(Get.context!).english,
                style: Get.textTheme.labelMedium,
              )),
          DropdownMenuItem(
              value: 1,
              child: Text(
                S.of(Get.context!).arabic,
                style: Get.textTheme.labelMedium,
              )),
        ]);
  }
}
