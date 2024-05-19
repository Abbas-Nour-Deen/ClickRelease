import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberPicker extends StatelessWidget {
  PhoneNumberPicker({super.key});

  String initialCountry = 'LB';
  PhoneNumber number2 = PhoneNumber(isoCode: 'LB', dialCode: '+961');

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
            enabledBorder: InputBorder.none,
            hintText: "Enter Phone Number"),
        textStyle: Get.textTheme.bodyMedium,
        onInputChanged: (PhoneNumber number) {
          number2 = number;
          print(number2.dialCode);
        },
        onInputValidated: (bool isValid) {
          if (!isValid) {
            print("not valid");
          } else {
            print("valid");
          }
        },
        validator: (p0) {
          if (p0!.length != 8) {
            return "invalid phone number";
          }
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          trailingSpace: false,
          useEmoji: true,
        ),
        autoValidateMode: AutovalidateMode.onUserInteraction,
        autoFocus: false,
        ignoreBlank: false,
        formatInput: true,
        initialValue: number2,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: false,
        ),
      ),
    );
  }
}
