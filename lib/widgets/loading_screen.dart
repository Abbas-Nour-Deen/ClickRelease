import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/widgets/public_widgets/noenternet_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          builder: (controller) => controller.enternetConnectionError
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: NoEnternetPlaceHolder())
              : Center(
                  child: CircularProgressIndicator.adaptive(),
                )),
    );
  }
}
