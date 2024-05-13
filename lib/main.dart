import 'package:click_release/controllers/theme_controller.dart';
import 'package:click_release/data/data_binding.dart';
import 'package:click_release/screens/regestration_Screens/entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _themeController =
      Get.put(ThemeController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Click',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(milliseconds: 200),
      theme: _themeController.theme,
      darkTheme: _themeController.theme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialBinding: AppBindings(),
      home: EntryScreen(),
    );
  }
}
