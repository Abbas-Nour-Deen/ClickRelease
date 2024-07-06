import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/data/api/login_api.dart';
import 'package:click_release/data/repo/login_repo.dart';
import 'package:click_release/screens/entry_screen.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final LoginController loginController = Get.put(
      LoginController(
          loginRepo:
              Get.put(LoginRepo(loginApiHandler: Get.put(LoginApiHandler())))),
      permanent: true);
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.white],
      ),
      childWidget: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset("assets/images/clickLogo.png"),
      ),
      duration: const Duration(milliseconds: 2500),
      animationDuration: const Duration(milliseconds: 1000),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen:
          loginController.isUserLogedin ? CustomNavBar() : const EntryScreen(),
    );
  }
}
