import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/widgets/public_widgets/noenternet_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        id: 'navbar',
        builder: (controller) => controller.enternetConnectionError
            ? NoEnternetPlaceHolder(
                onretry: () {
                  controller.getUserByID();
                },
              )
            : Container(
                child: Center(
                  child: Lottie.asset("assets/animations/ClickAnimation.json",
                      height: 250),
                ),
              ),
      ),
    );
  }
}
