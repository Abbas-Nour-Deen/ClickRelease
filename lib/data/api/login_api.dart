import 'dart:io';

import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginApiHandler extends GetConnect implements GetxService {
  GetStorage storage = GetStorage();
  late Map<String, String> _mainHeaders;

  LoginApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(minutes: 1);
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

  Future<Response> resendOTP(url, otpID) async {
    try {
      Response response = await post(url, {
        "otp_id": otpID,
      });

      print("resend otp status  ${response.body}");
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

  Future<http.Response> updateUser(
      {userName, sex, phoneNumber, File? profilePhoto, userID, url}) async {
    try {
      var request = http.MultipartRequest('PUT', Uri.parse(url));

      // Add fields to the request
      request.fields['clientId'] = userID;
      request.fields['clientUsername'] = userName;
      request.fields['Sex'] = sex;
      request.fields['clientPhone'] = phoneNumber;

      // Add the file to the request
      if (profilePhoto != null) {
        var file = await http.MultipartFile.fromPath(
            'profilePhoto', profilePhoto.path);
        request.files.add(file);
      }

      request.headers['Authorization'] = 'Bearer ${storage.read("token")}';

      // Send the request
      var streamedResponse = await request.send();

      // Get the response
      var response = await http.Response.fromStream(streamedResponse);

      print("received update user response ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return http.Response("failed", 100);
    }
  }
}
