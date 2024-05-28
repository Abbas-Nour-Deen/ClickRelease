import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpPinFieldWidget extends StatelessWidget {
  OtpPinFieldWidget({super.key});

  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: OtpPinField(
        maxLength: 6,
        autoFocus: false,
        fieldWidth: 50,
        fieldHeight: 50,
        key: _otpPinFieldController,
        onSubmit: (String text) {
          _loginController.validateOTP(otp: text);
        },
        onChange: (String text) {},
        autoFillEnable: true,
        otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
        otpPinFieldStyle: OtpPinFieldStyle(
            defaultFieldBackgroundColor: lightThemeDividerColor,
            activeFieldBackgroundColor: Colors.white,
            defaultFieldBorderColor: Colors.grey.shade200,
            activeFieldBorderColor: Get.theme.primaryColor),
      ),
    );
  }
}
