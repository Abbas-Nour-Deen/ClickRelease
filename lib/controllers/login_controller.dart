import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/screens/regestration_Screens/createAccount_screen.dart';
import 'package:click_release/screens/regestration_Screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginController extends GetxController with StateMixin {
  final DataRepo dataRepo;

  LoginController({required this.dataRepo});

  final TextEditingController phoneController = TextEditingController();

  PhoneNumber enteredNumber = PhoneNumber(isoCode: 'LB', dialCode: '+961');

  bool isPhoneNumberValid = false;

  String otpID = '';

  Future<void> sendOTP() async {
    try {
      if (isPhoneNumberValid) {
        change(null, status: RxStatus.loading());
        Get.to(OtpScreen());
        final response = await dataRepo.sendOtp("${enteredNumber.phoneNumber}");
        if (response.statusCode == 200) {
          change(null, status: RxStatus.success());
          otpID = response.body['data']["otp_id"];
          print("recieved otp id  ${otpID}");
        } else {
          print(response.statusCode);
        }
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid phone number !",
          duration: Duration(seconds: 3),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> validateOTP({required String otp}) async {
    try {
      change(null, status: RxStatus.loading());
      final response = await dataRepo.validateOTP(otp, otpID);
      if (response.statusCode == 200) {
        change(null, status: RxStatus.success());

        Get.to(const CreateAccountScreen());
        print("recieved otp response  ${response.body}");
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid OTP !",
          duration: Duration(seconds: 3),
        ));
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
