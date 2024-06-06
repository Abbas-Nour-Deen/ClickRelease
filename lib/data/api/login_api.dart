import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';

class LoginApiHandler extends GetConnect implements GetxService {
  LoginApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    maxAuthRetries = 50;
  }

  Future<Response> sendOTP(url, phoneNumber) async {
    try {
      Response response = await post(url, {"clientPhone": phoneNumber});

      print("recieved otp  ${response.statusCode}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> validateOTP(url, otp, otpID, phoneNumber) async {
    try {
      Response response = await post(
          url, {"otp_id": otpID, "otp_code": otp, "clientPhone": phoneNumber});

      print("recieved otp status  ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> createNewUser({
    url,
    firstName,
    lastName,
    userName,
    sex,
    phoneNumber,
  }) async {
    try {
      print(
          "firstname ${firstName}, last name ${lastName}, username ${userName}, sex ${sex}, phone ${phoneNumber}");
      Response response = await post(url, {
        "FirstName": firstName,
        "LastName": lastName,
        "clientUsername": userName,
        "sex": sex,
        "clientPhone": phoneNumber,
      });

      print("recieved create user response ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getUserByID(url) async {
    try {
      Response response = await get(url);

      print("recieved user by id  ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
