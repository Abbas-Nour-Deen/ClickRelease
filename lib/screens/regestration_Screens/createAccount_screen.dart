import 'package:click_release/widgets/custome_btn.dart';
import 'package:click_release/widgets/custome_input.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleWidget(),
              inputsWidget(),
              CustomeButton(
                text: "Click",
                ontap: () {
                  Get.to(() => CustomNavBar());
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: Get.textTheme.titleLarge,
          ),
          Text(
            "Fill your information below or register\narea with your social account.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget inputsWidget() {
    return Column(
      children: [
        CustomeInput(
          textcontroller: TextEditingController(),
          hint: "",
          type: "text",
          title: "Name",
        )
      ],
    );
  }
}
