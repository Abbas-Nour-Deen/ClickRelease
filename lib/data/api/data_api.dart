import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';

class DataApiHandler extends GetConnect implements GetxService {
  DataApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    maxAuthRetries = 50;
  }

  Future<Response> getAllCategories(url) async {
    try {
      Response response = await get(
        url,
      );

      print("recieved categories ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getAllServices(url) async {
    try {
      Response response = await get(
        url,
      );

      print("recieved data ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getProviders(url) async {
    try {
      print(url);
      Response response =
          await post(url, {"latitude": 40.7095, "longitude": -74.0025});

      print("recieved providers data ${response.statusCode}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getCurrentProviderReviews(url) async {
    try {
      Response response = await get(
        url,
      );

      print("recieved provider reviews ${response.statusCode}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
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

  Future<Response> validateOTP(url, otp, otpID) async {
    try {
      Response response = await post(url, {"otp_id": otpID, "otp_code": otp});

      print("recieved otp status  ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
