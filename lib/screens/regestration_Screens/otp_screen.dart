import 'package:click_release/screens/regestration_Screens/registration_widgets/otp_widget.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: CustomeButton(
          height: 45,
          text: "Verify",
          width: Get.width * 0.8,
          ontap: () {},
          margin: const EdgeInsets.only(bottom: 20),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          Container(
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
            ],
          ),
        ]));
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "OTP\n Verification Code",
            style: Get.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(Get.context!).size.height * 0.02,
          ),
          Text(
            "Please enter the code we just sent to\n +961 81 851 410",
            style: Get.textTheme.labelMedium!
                .copyWith(color: lightTHemeSecondTextColor),
            textAlign: TextAlign.center,
          ),
          OtpPinFieldWidget(),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  "Resend code in 00:50 sec",
                  style: Get.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(Get.context!).size.height * 0.03,
                ),
                richTextWidget()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget richTextWidget() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'By registering. You accept our ',
              style: Get.textTheme.bodySmall!
                  .copyWith(color: lightTHemeSecondTextColor)),
          TextSpan(
            text: 'privacy policy',
            style: Get.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: lightTHemeSecondTextColor,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
              text: ' &\n the ',
              style: Get.textTheme.bodyMedium!
                  .copyWith(color: lightTHemeSecondTextColor)),
          TextSpan(
            text: 'terms and condition',
            style: Get.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: lightTHemeSecondTextColor),
          ),
        ],
      ),
    );
  }
}
