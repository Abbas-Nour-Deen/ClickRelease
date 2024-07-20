import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';

class DataApiHandler extends GetConnect implements GetxService {
  late Map<String, String> _mainHeaders;

  final LoginController loginController = Get.find();
  final LocationController locationController = Get.find();
  DataApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 60);
    maxAuthRetries = 50;
    _mainHeaders = {
      'Authorization': 'Bearer ${loginController.userToken}',
      'Content-Type': 'application/json',
    };
  }

  Future<Response> getAllCategories(url) async {
    try {
      print("called with this token ${loginController.userToken}");
      Response response = await get(url, headers: _mainHeaders);

      print("recieved categories ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getAllServices(url) async {
    try {
      Response response = await get(url, headers: _mainHeaders);

      print("recieved data ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getProviders(url, tStamp) async {
    try {
      print(
          "CALLED WITH THIS LOCATION latitude ${locationController.pickedLocation.latitude} longitude ${locationController.pickedLocation.longitude}");

      Response response = await post(url, headers: _mainHeaders, {
        'clientId': loginController.currentUserID,
        "latitude": locationController.pickedLocation.longitude,
        "longitude": locationController.pickedLocation.latitude,
        "tStamp": tStamp,
        "count": 7
      });

      print("recieved providers data ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getCurrentProviderReviews(url) async {
    try {
      Response response = await get(url, headers: _mainHeaders);

      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getProvidersBySearch(url) async {
    try {
      Response response = await post(
          url,
          headers: _mainHeaders,
          {'clientId': loginController.currentUserID});

      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getTopProviders(url) async {
    try {
      Response response = await post(
          url,
          headers: _mainHeaders,
          {'clientId': loginController.currentUserID});

      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getdataByFilter(url, serviceId, zoneId, categoryID) async {
    try {
      Response response = await post(url, headers: _mainHeaders, {
        'clientId': loginController.currentUserID,
        "serviceId": serviceId,
        "zoneId": zoneId,
        'categoryID': categoryID
      });

      print("recieved filtered data  ${response.body}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> likeProvider(
      {required url,
      required provID,
      required isFvorite,
      required clientID}) async {
    try {
      Response response = await post(
          url,
          headers: _mainHeaders,
          {"provID": provID, "favor": isFvorite, "clientId": clientID});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> rateProvider(
      {required url,
      required provID,
      required comment,
      required rate,
      required clientID,
      required entryUser,
      required updateUser}) async {
    try {
      Response response = await post(url, headers: _mainHeaders, {
        "provID": provID,
        "comment": comment,
        "rate": rate,
        'clientId': clientID,
        "entryUser": entryUser,
        "updateUser": updateUser
      });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
