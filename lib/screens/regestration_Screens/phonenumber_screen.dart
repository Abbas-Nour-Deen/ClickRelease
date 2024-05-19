import 'package:click_release/screens/regestration_Screens/otp_screen.dart';
import 'package:click_release/screens/regestration_Screens/registration_widgets/phoneNumber_picker.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomeButton(
        height: 45,
        text: "Next",
        width: Get.width * 0.8,
        ontap: () => Get.to(OtpScreen()),
        margin: const EdgeInsets.only(bottom: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: LayoutBuilder(
          builder: (context, constraints) => Stack(children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/OTP.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    title(),
                    phoneNumberField(),
                  ],
                ),
              ])),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          children: [
            Text(
              "Let's get you started\n with Click!",
              style: Get.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Enter your phone number",
              style: Get.textTheme.labelMedium!
                  .copyWith(color: lightTHemeSecondTextColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget phoneNumberField() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "We'll send a text message to verify and confirm\n it's you.",
            style: Get.textTheme.labelMedium!
                .copyWith(color: lightTHemeSecondTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          PhoneNumberPicker(),
        ],
      ),
    );
  }
}
