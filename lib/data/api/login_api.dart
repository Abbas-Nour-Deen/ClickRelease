import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginApiHandler extends GetConnect implements GetxService {
  GetStorage storage = GetStorage();
  late Map<String, String> _mainHeaders;

  LoginApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    maxAuthRetries = 50;

    _mainHeaders = {
      'Authorization': 'Bearer ${storage.read("token")}',
      'Content-Type': 'application/json',
    };
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
      Response response = await get(url, headers: _mainHeaders);

      print("recieved user by id  ${response.body} ${response.statusCode} ");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> updateUser(
      {userName, sex, phoneNumber, profilePhoto, userID, url}) async {
    print("called witsh sex ${sex}");
    try {
      Response response = await put(
          url,
          {
            "clientId": userID,
            "clientUsername": userName,
            "Sex": sex,
            "clientPhone": phoneNumber,
          },
          headers: _mainHeaders);

      print("recieved update user response ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
