import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberPicker extends StatelessWidget {
  final LoginController loginController;
  PhoneNumberPicker({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.74,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: const BoxDecoration(
          color: lightThemeDividerColor,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: InternationalPhoneNumberInput(
        textAlignVertical: TextAlignVertical.top,
        inputDecoration: const InputDecoration(
            hintStyle: TextStyle(
              color: lightTHemeSecondTextColor,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Enter Phone Number"),
        textStyle: Get.textTheme.bodyMedium,
        onInputChanged: (PhoneNumber number) {
          loginController.enteredNumber = number;
          print("code ${loginController.enteredNumber.dialCode}");
          print("number ${loginController.enteredNumber.phoneNumber}");

          print("iso code ${loginController.enteredNumber.isoCode}");
        },
        onInputValidated: (bool isValid) {
          loginController.isPhoneNumberValid = isValid;
          if (!isValid) {
            print("not valid");
          } else {
            print("valid");
          }
        },
        validator: (p0) {
          if (!loginController.isPhoneNumberValid) {
            return "invalid phone number";
          }

          // if (p0!.length != 8) {
          // }
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          trailingSpace: false,
          useEmoji: true,
        ),
        autoValidateMode: AutovalidateMode.disabled,
        autoFocus: false,
        ignoreBlank: false,
        formatInput: true,
        initialValue: loginController.enteredNumber,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: false,
        ),
      ),
    );
  }
}
