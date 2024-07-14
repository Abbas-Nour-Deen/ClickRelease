import 'package:click_release/data/api/login_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  Future<Response> resendOTP(otpID) async {
    return await loginApiHandler.resendOTP("api/resend-otp", otpID);
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

  Future<http.Response> updateUser(
      {userName, sex, phoneNumber, profilePhoto, userID}) async {
    return await loginApiHandler.updateUser(
        profilePhoto: profilePhoto,
        userID: userID,
        url: "https://click-server-5.onrender.com/api/client",
        phoneNumber: phoneNumber,
        sex: sex,
        userName: userName);
  }

  Future<Response> getUserByID({required String userID}) async {
    return await loginApiHandler.getUserByID("api/client/$userID");
  }
}
