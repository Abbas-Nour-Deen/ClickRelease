import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  final _key = 'isDarkMode';
  final _box = GetStorage();

  ThemeData get theme => _loadTheme() ? darkTheme : lightTheme;
  bool _loadTheme() => _box.read(_key) ?? false;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadTheme() ?? false;

    print('Theme Controller initialized');
  }

  void toggleDarkMode() async {
    isDarkMode.value = !isDarkMode.value;
    Get.isDarkMode == isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);

    saveTheme(isDarkMode.value);
    update();
  }

  void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
}
