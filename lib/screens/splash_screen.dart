import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/data/api/login_api.dart';
import 'package:click_release/data/repo/login_repo.dart';
import 'package:click_release/screens/entry_screen.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final LoginController loginController = Get.put(
      LoginController(
          loginRepo:
              Get.put(LoginRepo(loginApiHandler: Get.put(LoginApiHandler())))),
      permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        dispose: (state) {
          // Remove the listener when the widget is disposed (navigation)
          loginController.videoController.removeListener(
            () {
              loginController.videoController.dispose();
            },
          );
        },
        initState: (state) {
          loginController.videoController.initialize().then((_) {
            loginController.videoController.addListener(() {
              if (loginController.videoController.value.position ==
                  loginController.videoController.value.duration) {
                Get.to(loginController.isUserLogedin
                    ? CustomNavBar()
                    : const EntryScreen());
              }
            });
            loginController.videoController.play();
          });
        },
        builder: (controller) => VideoPlayer(loginController.videoController));
  }
}
//  loginController.isUserLogedin ? CustomNavBar() : const EntryScreen()