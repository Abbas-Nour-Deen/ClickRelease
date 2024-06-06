import 'dart:convert';
import 'package:click_release/data/repo/login_repo.dart';
import 'package:click_release/models/gender_model.dart';
import 'package:click_release/models/user_model.dart';
import 'package:click_release/screens/regestration_Screens/createAccount_screen.dart';
import 'package:click_release/screens/regestration_Screens/otp_screen.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with StateMixin {
  final LoginRepo loginRepo;

  LoginController({required this.loginRepo});

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

  GetStorage storage = GetStorage();

  late String userToken;
  late UserModel currentUser;
  bool isUserLogedin = false;
  late String? currentUserID;

  bool isTokenLoading = false;

  Future<void> sendOTP() async {
    try {
      if (isPhoneNumberValid) {
        change(null, status: RxStatus.loading());
        Get.to(OtpScreen());
        final response =
            await loginRepo.sendOtp("${enteredNumber.phoneNumber}");
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
          await loginRepo.validateOTP(otp, otpID, enteredNumber.phoneNumber);
      print("recieved otp response  ${response.body}");

      if (response.statusCode == 200) {
        change(null, status: RxStatus.success());

        if (response.body['message'] ==
            'OTP verified successfully, User does not exist') {
          Get.to(CreateAccountScreen());
        } else if (response.body['message'] == 'User already exists') {
          final data = response.body;
          final userData = data['data'];
          final userList = userData['User'];

          currentUser = UserModel.fromJson(userList[0]);

          userToken = userData['token'];
          storage.write("token", userToken);
          storage.write("isLogedin", true);
          storage.write("userID", currentUser.userID);

          print(
              "currentUser ${currentUser.firstName},  ${currentUser.lastName}");
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
      final response = await loginRepo.createNewUser(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: enteredNumber.phoneNumber,
          sex: selectedGender!.code,
          userName: userNameController.text);

      if (response.statusCode == 200) {
        final data = response.body;
        final userList = data['User'];

        currentUser = UserModel.fromJson(userList[0]);

        userToken = response.body['token'];
        storage.write("token", userToken);
        storage.write("isLogedin", true);
        storage.write("userID", currentUser.userID);

        Get.to(CustomNavBar());
        print("new user response  ${response.body}");
        print("new user token  ${userToken}");
        print("new user id  ${currentUser.userID}");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loadKeys() async {
    isUserLogedin = storage.read("isLogedin") ?? false;

    if (isUserLogedin) {
      print("user already logedin, calling get user by id");
      currentUserID = storage.read("userID") ?? "";
    }

    print("loaded user token ${jsonEncode(userToken)}");
    print("loaded user id ${currentUserID}");
  }

  Future<void> getUserByID() async {
    if (currentUserID != null) {
      isTokenLoading = true;
      try {
        final response = await loginRepo.getUserByID(userID: currentUserID!);
        final data = response.body;

        if (response.statusCode == 200 && data['message'] == 'User fetched') {
          userToken = data['token'];

          final userList = data['User'];

          currentUser = UserModel.fromJson(userList[0]);
          storage.write("token", userToken);
          storage.write("userID", currentUser.userID);

          isTokenLoading = false;
          update();
        }
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadKeys();
  }
}
