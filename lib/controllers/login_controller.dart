import 'dart:io';
import 'package:click_release/controllers/loading_controller.dart';
import 'package:click_release/controllers/notification_controller.dart';
import 'package:click_release/data/repo/login_repo.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/gender_model.dart';
import 'package:click_release/models/user_model.dart';
import 'package:click_release/screens/createAccount_screen.dart';
import 'package:click_release/screens/otp_screen.dart';
import 'package:click_release/screens/phonenumber_screen.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

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
  String temperorGenderCode = '';
  String temporarProfilePath = '';
  GetStorage storage = GetStorage();

  late String userToken;
  late UserModel currentUser;
  bool isUserLogedin = false;
  String? currentUserID;

  bool isTokenLoading = false;
  File? pickedProfilePhoto;
  File? savedPickedProfilePhoto;

  final LoadingController loadingController = Get.put(LoadingController());
  final OtpTimerButtonController timerController = OtpTimerButtonController();
  bool enternetConnectionError = false;

  final VideoPlayerController videoController = VideoPlayerController.asset(
      "assets/animations/mp43.mp4",
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false));

  final NotificationController notificationController =
      Get.put(NotificationController());

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
        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).invalidphonenumber,
            duration: 4);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> resendOTP() async {
    try {
      timerController.startTimer();
      final response = await loginRepo.resendOTP(
        otpID,
      );

      if (response.statusCode == 200) {
        loadingController.showCustomeDialog(
            type: "success",
            title: "Success",
            body: "OTP resend successfully",
            duration: 3);
      } else {
        loadingController.showCustomeDialog(
            type: "error",
            title: "Failed",
            body: "Failed to resend OTP",
            duration: 3);
      }
    } catch (e) {}
  }

  Future<void> validateOTP({required String otp}) async {
    try {
      change(null, status: RxStatus.loading());
      loadingController.showLoadingDialog();
      final response =
          await loginRepo.validateOTP(otp, otpID, enteredNumber.phoneNumber);
      print("recieved otp response  ${response.body}");

      if (response.statusCode == 200) {
        change(null, status: RxStatus.success());

        if (response.body['message'] ==
            'OTP verified successfully, User does not exist') {
          Get.back();
          loadingController.showCustomeDialog(
              type: "success",
              title: S.of(Get.context!).success,
              body: S.of(Get.context!).otpverefiedsuccessfully,
              duration: 3);

          Future.delayed(const Duration(seconds: 2))
              .then((value) => Get.to(CreateAccountScreen()));
        } else if (response.body['message'] == 'User already exists') {
          final data = response.body;
          final userData = data['data'];
          final userList = userData['User'];

          currentUser = UserModel.fromJson(userList[0]);
          currentUserID = currentUser.userID;

          userToken = userData['token'];
          storage.write("token", userToken);
          storage.write("isLogedin", true);
          storage.write("userID", currentUser.userID);
          Get.back();

          print(
              "currentUser ${currentUser.firstName},  ${currentUser.lastName}");

          loadingController.showCustomeDialog(
              type: "success",
              title: S.of(Get.context!).welcomeBack,
              body: S.of(Get.context!).alreadyhaveanaccount,
              duration: 4);

          Future.delayed(const Duration(seconds: 2))
              .then((value) => Get.to(CustomNavBar()));
        }

        print("recieved otp response  ${response.body}");
      } else {
        Get.back();

        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).invalidotp,
            duration: 4);
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createNewUser() async {
    try {
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          userNameController.text.isEmpty ||
          selectedGender == null) {
        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: "All fields are required !",
            duration: 4);
        return;
      }

      loadingController.showLoadingDialog();

      final response = await loginRepo.createNewUser(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: enteredNumber.phoneNumber,
          sex: selectedGender!.code,
          userName: userNameController.text);

      if (response.statusCode == 200) {
        final data = response.body;
        final userList = data['User'];
        Get.back();
        loadingController.showCustomeDialog(
            type: "success",
            title: S.of(Get.context!).success,
            body: S.of(Get.context!).signedupsuccessfuly,
            duration: 4);

        currentUser = UserModel.fromJson(userList[0]);
        currentUserID = currentUser.userID;

        userToken = response.body['token'];
        storage.write("token", userToken);
        storage.write("isLogedin", true);
        storage.write("userID", currentUser.userID);

        Future.delayed(const Duration(seconds: 2))
            .then((value) => Get.to(CustomNavBar()));

        print("new user response  ${response.body}");
        print("new user token  ${userToken}");
        print("new user id  ${currentUser.userID}");
      } else {
        Get.back();
        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).tryagain,
            duration: 4);
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loadKeys() async {
    isUserLogedin = storage.read("isLogedin") ?? false;

    if (!isUserLogedin) {
      await notificationController.initializeNotification();
    }

    if (isUserLogedin) {
      print("user already logedin, calling get user by id");
      currentUserID = storage.read("userID") ?? "";
    }

    print("loaded user id ${currentUserID}");
  }

  Future<void> getUserByID() async {
    if (currentUserID != null) {
      isTokenLoading = true;
      enternetConnectionError = false;
      update(['navbar']);
      try {
        print("current user id$currentUserID");
        final response = await loginRepo.getUserByID(userID: currentUserID!);
        final data = response.body;

        if (response.statusCode == 200 && data['message'] == 'User fetched') {
          userToken = data['token'];

          final userList = data['User'];

          currentUser = UserModel.fromJson(userList[0]);
          storage.write("token", userToken);
          storage.write("userID", currentUser.userID);

          selectedGender =
              genders.where((element) => element.code == currentUser.sex).first;
          temperorGenderCode = selectedGender!.code;

          isTokenLoading = false;
          update(['navbar']);
        } else {
          print("no internetttttt");
          userToken = '';
          enternetConnectionError = true;

          update(['navbar']);
        }
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<void> updateUser() async {
    try {
      if (userNameController.text.isEmpty &&
          selectedGender!.code == temperorGenderCode &&
          (pickedProfilePhoto == null ||
              temporarProfilePath == pickedProfilePhoto!.path)) {
        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).Nochangesdetected,
            duration: 4);
        return;
      }

      loadingController.showLoadingDialog();

      final response = await loginRepo.updateUser(
          profilePhoto: pickedProfilePhoto,
          phoneNumber: currentUser.clientPhone,
          sex: selectedGender!.code,
          userID: currentUser.userID,
          userName: userNameController.text.isEmpty
              ? currentUser.clientUsername
              : userNameController.text);

      if (response.statusCode == 200) {
        currentUser.clientUsername = userNameController.text.isEmpty
            ? currentUser.clientUsername
            : userNameController.text;
        temporarProfilePath = pickedProfilePhoto!.path;
        Get.back();
        Get.back();

        update(['profilePhoto']);

        loadingController.showCustomeDialog(
            type: "success",
            title: S.of(Get.context!).success,
            body: S.of(Get.context!).userupdatedsuccessfully,
            duration: 3);

        if (userNameController.text.isNotEmpty) {
          userNameController.clear();
        }

        savedPickedProfilePhoto = pickedProfilePhoto;
      } else if (response.statusCode == 409) {
        Get.back();

        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).usernamealreadyexists,
            duration: 3);
        print(response.statusCode);
      } else {
        Get.back();

        loadingController.showCustomeDialog(
            type: "error",
            title: S.of(Get.context!).error,
            body: S.of(Get.context!).checknetwork,
            duration: 3);
        print("update user status code ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();

    // Pick image from gallery
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Create a File object from the picked image path
      pickedProfilePhoto = File(pickedFile.path);

      print("picked image ${pickedFile.path}");

      update(['profilePhoto']);
    } else {
      print('No image picked');
    }
  }

  void launchUrls({required String type}) async {
    try {
      final Uri termsandConditionsUrl =
          Uri.parse("http://216.225.199.11:8091/click/termsAndConditions.html");

      final privacyPolicyUri =
          Uri.parse('http://216.225.199.11:8091/click/privacypolicy.html');

      final aboutUsUri =
          Uri.parse("http://216.225.199.11:8091/click/aboutus.html");

      switch (type) {
        case "termsandconditions":
          if (await canLaunchUrl(termsandConditionsUrl)) {
            await launchUrl(termsandConditionsUrl,
                mode: LaunchMode.inAppBrowserView,
                browserConfiguration: BrowserConfiguration(showTitle: false));
            break;
          }

        case "privacypolicy":
          if (await canLaunchUrl(privacyPolicyUri)) {
            await launchUrl(privacyPolicyUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
        case "aboutus":
          if (await canLaunchUrl(aboutUsUri)) {
            await launchUrl(aboutUsUri,
                mode: LaunchMode.externalNonBrowserApplication);
            break;
          }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void shareApp(text) async {
    final box = Get.context!.findRenderObject() as RenderBox?;

    await Share.share(
      text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  void logOut() async {
    await storage.write("isLogedin", false);
    Get.offAll(() => PhoneNumberScreen());
  }

  @override
  void onInit() {
    super.onInit();
    loadKeys();
  }
}
