import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/widgets/otp_widget.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final LoginController logInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Please enter the code we just sent to\n ${logInController.enteredNumber.phoneNumber}",
            style: Get.textTheme.labelMedium!
                .copyWith(color: lightTHemeSecondTextColor),
            textAlign: TextAlign.center,
          ),
          OtpPinFieldWidget(),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                GetBuilder<LoginController>(
                    id: "otptimer",
                    builder: (controller) => OtpTimerButton(
                          buttonType: ButtonType.text_button,
                          backgroundColor: Colors.transparent,
                          controller: logInController.timerController,
                          onPressed: () {
                            logInController.resendOTP();
                          },
                          text: Text('Resend code ',
                              style: Get.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: lightTHemeSecondTextColor,
                              )),
                          duration: 60,
                        )),
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                logInController.launchUrls(type: "privacypolicy");
              },
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                logInController.launchUrls(type: "termsandconditions");
              },
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
