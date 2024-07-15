import 'dart:async';
import 'package:click_release/models/pickedlocation_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController with StateMixin {
  RxBool isLocationEnabled = false.obs;

  PickedLocationModel pickedLocation = PickedLocationModel(
      longitude: 35.513963, latitude: 33.8709085, locationName: "");

  Completer<GoogleMapController> googleMapController = Completer();
  CameraPosition? cameraPosition;
  String draggedAddress = "";

  Future<void> getAddress(LatLng position) async {
    final List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(position.latitude, position.longitude);
    final geocoding.Placemark address = placemarks[0];
    final String addressStr =
        "${address.locality}, ${address.administrativeArea}, ${address.country}";
    draggedAddress = addressStr;
    pickedLocation.locationName = addressStr;
    print("final picked location ${pickedLocation.locationName}");
    change(pickedLocation, status: RxStatus.success());
  }

  Future<void> determineUserCurrentPosition() async {
    change(pickedLocation, status: RxStatus.loading());
    LocationPermission locationPermission = await Geolocator.checkPermission();
    print(locationPermission.name);
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        // Handle case when permission is permanently denied
        change(pickedLocation, status: RxStatus.error());

        print("Location permission denied forever");
      } else if (locationPermission == LocationPermission.denied) {
        // Handle case when permission is denied
        change(pickedLocation, status: RxStatus.error());

        print("Location permission denied");
      } else {
        // Permission granted, continue
        await getLocation().then((value) async => await getAddress(
            LatLng(pickedLocation.latitude, pickedLocation.longitude)));

        cameraPosition = CameraPosition(
            zoom: 13,
            target: LatLng(pickedLocation.latitude, pickedLocation.longitude));
      }
    } else if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      await getLocation().then((value) async => await getAddress(
          LatLng(pickedLocation.latitude, pickedLocation.longitude)));

      cameraPosition = CameraPosition(
          zoom: 13,
          target: LatLng(pickedLocation.latitude, pickedLocation.longitude));
    } else {
      print("Location permission unknown");
    }
    update();
  }

  Future<void> getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: Duration(minutes: 1));

      pickedLocation.latitude = position.latitude;
      pickedLocation.longitude = position.longitude;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      } else if (e.code == 'LOCATION_SERVICES_DISABLED') {
        print('Location services are disabled');
      }
    } catch (e) {
      // change(pickedLocation, status: RxStatus.error());

      print('Failed to get location: $e');
    } finally {}
  }

  void onCameraIdle(LatLng draggedLatLng) {
    getAddress(draggedLatLng);
  }

  void onCameraMove(CameraPosition cameraPosition) {
    pickedLocation.latitude = cameraPosition.target.latitude;
    pickedLocation.longitude = cameraPosition.target.longitude;
  }

  @override
  void onInit() {
    super.onInit();

    determineUserCurrentPosition();
  }
}
