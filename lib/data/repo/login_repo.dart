import 'package:click_release/data/api/login_api.dart';
import 'package:get/get.dart';

class LoginRepo extends GetxService {
  final LoginApiHandler loginApiHandler;

  LoginRepo({required this.loginApiHandler});

  Future<Response> sendOtp(phoneNumber) async {
    return await loginApiHandler.sendOTP("api/send-otp", phoneNumber);
  }

  Future<Response> validateOTP(otp, otpID, phoneNumber) async {
    return await loginApiHandler.validateOTP(
        "api/verify-otp", otp, otpID, phoneNumber);
  }

  Future<Response> createNewUser(
      {firstName, lastName, userName, sex, phoneNumber, profilePhoto}) async {
    return await loginApiHandler.createNewUser(
        url: "api/client",
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        sex: sex,
        userName: userName);
  }

  Future<Response> getUserByID({required String userID}) async {
    return await loginApiHandler.getUserByID("api/client/$userID");
  }
}
