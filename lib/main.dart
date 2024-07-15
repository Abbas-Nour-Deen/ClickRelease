import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/controllers/theme_controller.dart';
import 'package:click_release/data/data_binding.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _themeController =
      Get.put(ThemeController(), permanent: true);

  final LocalizationController _localizationController =
      Get.put(LocalizationController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Click',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(milliseconds: 200),
      theme: _themeController.theme,
      darkTheme: _themeController.theme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: _localizationController.selectedLang.value.isNotEmpty
          ? Locale(_localizationController.selectedLang.value)
          : Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialBinding: AppBindings(),
      home: SplashScreen(),
    );
  }
}
