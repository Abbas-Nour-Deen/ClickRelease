import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberPicker extends StatelessWidget {
  PhoneNumberPicker({
    super.key,
  });

  final LoginController logInController = Get.find();

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
          logInController.enteredNumber = number;
          print("code ${logInController.enteredNumber.dialCode}");
          print("number ${logInController.enteredNumber.phoneNumber}");

          print("iso code ${logInController.enteredNumber.isoCode}");
        },
        onInputValidated: (bool isValid) {
          logInController.isPhoneNumberValid = isValid;
          if (!isValid) {
            print("not valid");
          } else {
            print("valid");
          }
        },
        validator: (p0) {
          if (!logInController.isPhoneNumberValid) {
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
        initialValue: logInController.enteredNumber,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: false,
        ),
      ),
    );
  }
}
