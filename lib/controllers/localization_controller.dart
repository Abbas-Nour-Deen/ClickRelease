import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationController extends GetxController {
  final RxString selectedLang = 'en'.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadLanguage(); // Load language when controller initializes
    print('Localization Controller initialized');
  }

  Future<void> loadLanguage() async {
    final box = GetStorage();
    // await box.initStorage; // Initialize GetStorage
    selectedLang.value =
        box.read('language') ?? 'en'; // Read language from storage
    print('loaded language: ${selectedLang.value}');
  }

  void changeLanguage(int v) async {
    // await box.initStorage; // Initialize GetStorage

    if (v == 1) {
      selectedLang.value = 'ar';
      box.write('language', selectedLang.value); // Write language to storage
      print('saved language: ${selectedLang.value}');

      Get.updateLocale(Locale('ar'));
    } else {
      selectedLang.value = 'en';
      box.write('language', selectedLang.value); // Write language to storage

      Get.updateLocale(Locale('en'));
      update(['placeholders']);
    }
    print(selectedLang.value.toString());
  }
}
