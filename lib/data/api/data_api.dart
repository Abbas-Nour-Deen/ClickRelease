import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/data/appconfig.dart';
import 'package:get/get.dart';

class DataApiHandler extends GetConnect implements GetxService {
  DataApiHandler() {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    maxAuthRetries = 50;
  }

  final LocationController _locationController = Get.find();
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
      print(_locationController.pickedLocation.longitude.toString());
      print(_locationController.pickedLocation.latitude.toString());
      Response response = await post(url, {
        "longitude": _locationController.pickedLocation.longitude.toString(),
        "latitude": _locationController.pickedLocation.latitude.toString()
      });

      print("recieved providers data ${response.statusCode}");
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getCurrentProviderReviews(url) async {
    try {
      print(_locationController.pickedLocation.longitude.toString());
      print(_locationController.pickedLocation.latitude.toString());
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
}
