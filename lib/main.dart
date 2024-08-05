import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/data/data_binding.dart';
import 'package:click_release/firebase_options.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/splash_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LocalizationController _localizationController =
      Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      title: 'Click',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: const Duration(milliseconds: 200),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
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
