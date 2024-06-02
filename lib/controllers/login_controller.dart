import 'package:click_release/data/repo/data_repo.dart';
import 'package:click_release/models/gender_model.dart';
import 'package:click_release/screens/regestration_Screens/createAccount_screen.dart';
import 'package:click_release/screens/regestration_Screens/otp_screen.dart';
import 'package:click_release/widgets/nav_bar.dart';
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

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final List<GenderModel> genders = [
    GenderModel(type: 'Male', code: '956cd7f0-4c87-4ac0-a7b7-6afbda52f4f8'),
    GenderModel(type: 'Female', code: "c6d7c072-da59-4af4-aceb-beb6b7973908"),
  ];

  GenderModel? selectedGender;

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
      final response =
          await dataRepo.validateOTP(otp, otpID, enteredNumber.phoneNumber);
      print("recieved otp response  ${response.body}");

      if (response.statusCode == 200) {
        change(null, status: RxStatus.success());

        if (response.body['message'] ==
            'OTP verified successfully, User does not exist') {
          Get.to(CreateAccountScreen());
        } else if (response.body['message'] == 'User already exists') {
          Get.showSnackbar(const GetSnackBar(
            message: "Welcome Back!",
            duration: Duration(seconds: 3),
          ));
          Future.delayed(const Duration(seconds: 2))
              .then((value) => Get.to(CustomNavBar()));
        }

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

  Future<void> createNewUser() async {
    try {
      final response = await dataRepo.createNewUser(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: enteredNumber.phoneNumber,
          profilePhoto: null,
          sex: selectedGender!.code,
          userName: userNameController.text);

      if (response.statusCode == 200) {
        print("new user response  ${response.body}");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
