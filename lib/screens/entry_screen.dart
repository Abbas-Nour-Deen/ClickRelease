import 'package:click_release/widgets/onBoarding/onboarding_view.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            imageWidget(),
            // Image.network(
            //   "https://clickdb.blob.core.windows.net/client/81019355/profilePhoto?sv=2024-05-04&se=2024-05-21T19%3A11%3A48Z&sr=b&sp=r&sig=b3JKq9ZfDS4lr%2FYU6u2irUiZsXpRn0hQoUsKnGLuoCw%3D",
            // ),
            title(),
            btnWidget(),
          ],
        ),
      ),
    ));
  }

  Widget imageWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Image.asset("assets/images/Onboarding1.png"),
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
        width: 300,
        height: 45,
        ontap: () {
          Get.to(() => OnboardingView());
        },
      ),
    );
  }
}
