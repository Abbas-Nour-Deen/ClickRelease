import 'package:click_release/screens/regestration_Screens/createAccount_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [imageWidget(), title(), btnWidget(), signInText()],
      ),
    ));
  }

  Widget imageWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Image.asset("assets/images/entry.png"),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Text(
            "Welcome to Click",
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Connect with professionals in your\narea effortlessly",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget btnWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: CustomeButton(
        text: "Let’s Get Started",
        width: Get.width * 0.8,
        height: 45,
        ontap: () {
          Get.to(() => CreateAccountScreen());
        },
      ),
    );
  }

  Widget signInText() {
    return GestureDetector(
      onTap: () {
        print("Text Clicked");
      },
      child: RichText(
        text: TextSpan(
          text: 'Already have an account ',
          style: Get.textTheme.labelMedium,
          children: <TextSpan>[
            TextSpan(
                text: 'Sign In',
                style: Get.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    color: lightTHemeSecondTextColor)),
          ],
        ),
      ),
    );
  }
}
