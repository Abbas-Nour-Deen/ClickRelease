import 'dart:async';

import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinFieldWidget extends StatelessWidget {
  OtpPinFieldWidget({super.key});

  final LoginController _loginController = Get.find();

  StreamController<ErrorAnimationType> errorController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        child: PinCodeTextField(
          appContext: context,
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          obscureText: false,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            activeColor: Colors.white,
            inactiveColor: lightThemeDividerColor,
            selectedColor: Get.theme.primaryColor,
            inactiveFillColor: lightThemeDividerColor,
            selectedFillColor: Colors.white,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: TextEditingController(),
          onCompleted: (v) {
            print("Completed");
            _loginController.validateOTP(otp: v);
          },
          onChanged: (value) {
            print(value);
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ));
  }
}
