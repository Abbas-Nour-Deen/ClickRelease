import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';

class DataApiHandler extends GetConnect implements GetxService {
  late Map<String, String> _mainHeaders;

  final LoginController loginController = Get.find();

  DataApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
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

  Future<Response> getProviders(url) async {
    try {
      print(url);
      Response response = await post(
          url,
          headers: _mainHeaders,
          {"latitude": 40.7095, "longitude": -74.0025});

      print("recieved providers data ${response.statusCode}");
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

  Future<Response> getdataByFilter(
      url, serviceId, zoneId, rate, categoryID) async {
    try {
      print("service id : $serviceId, zoneID: $zoneId, categoryID:$categoryID");
      Response response = await post(url, headers: _mainHeaders, {
        "serviceId": serviceId,
        "zoneId": zoneId,
        "rate": 0,
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
}
