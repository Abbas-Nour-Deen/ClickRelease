import 'dart:math';

import 'package:click_release/controllers/location_controller.dart';
import 'package:get/get.dart';

class ProviderCalculations extends GetxController {
  final LocationController locationController = Get.find();

  double calculateDistance(double providerLat, double providerLong) {
    const double earthRadius = 6371; // Radius of the earth in kilometers

    // Convert degrees to radians
    double userLatRad =
        _degreesToRadians(locationController.pickedLocation.latitude);
    double userLongRad =
        _degreesToRadians(locationController.pickedLocation.longitude);
    double providerLatRad = _degreesToRadians(providerLong);
    double providerLongRad = _degreesToRadians(providerLat);

    // Haversine formula
    double dLat = providerLatRad - userLatRad;
    double dLon = providerLongRad - userLongRad;
    double a = pow(sin(dLat / 2), 2) +
        cos(userLatRad) * cos(providerLatRad) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double calculatedDistance = earthRadius * c;

    return calculatedDistance; // Distance in kilometers
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
