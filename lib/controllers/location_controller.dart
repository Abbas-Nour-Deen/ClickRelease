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
      longitude: 0.0, latitude: 0.0, locationName: "searching");

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
    update();
  }

  Future<void> determineUserCurrentPosition() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    print(locationPermission.name);
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        // Handle case when permission is permanently denied
        print("Location permission denied forever");
      } else if (locationPermission == LocationPermission.denied) {
        // Handle case when permission is denied
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
      );
      pickedLocation.latitude = position.latitude;
      pickedLocation.longitude = position.longitude;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      } else if (e.code == 'LOCATION_SERVICES_DISABLED') {
        print('Location services are disabled');
      }
    } catch (e) {
      print('Failed to get location: $e');
    } finally {}
  }

  @override
  void onInit() {
    super.onInit();

    determineUserCurrentPosition();
  }

  // Future<void> gotoUserCurrentPosition() async {
  //   final locater.Position currentPosition =
  //       await determineUserCurrentPosition();
  //   gotoSpecificPosition(
  //     LatLng(currentPosition.latitude, currentPosition.longitude),
  //   );
  // }

  // Future<void> determineUserCurrentPosition() async {
  //   locater.LocationPermission locationPermission;

  // final bool isLocationServiceEnabled =
  //     await locater.Geolocator.isLocationServiceEnabled();

  //   //   if (!serviceEnabled) {
  //   //     await checkLocationStatus();
  //   //     serviceEnabled = isLocationEnabled.value;
  //   //   }

  //   if (!isLocationServiceEnabled) {
  //     pickedLocation.locationName = "Select Location";
  //     update();
  //     return;
  //   }

  //   locationPermission = await locater.Geolocator.checkPermission();

  //   if (locationPermission == locater.LocationPermission.denied) {
  //     locationPermission = await locater.Geolocator.requestPermission();
  //   }

  //   if (locationPermission != locater.LocationPermission.denied ||
  //       locationPermission != locater.LocationPermission.deniedForever ||
  //       locationPermission != locater.LocationPermission.unableToDetermine) {
  //     locater.Position currentPosition =
  //         await locater.Geolocator.getCurrentPosition(
  //       desiredAccuracy: locater.LocationAccuracy.high,
  //     );
  //     await getAddress(
  //         LatLng(currentPosition.latitude, currentPosition.longitude));
  // cameraPosition = CameraPosition(
  //     zoom: 13,
  //     target: LatLng(currentPosition.latitude, currentPosition.longitude));
  //     pickedLocation.longitude = currentPosition.longitude;
  //     pickedLocation.latitude = currentPosition.latitude;
  //     print(
  //         "abbas location latitude ${pickedLocation.latitude}, longitude ${pickedLocation.longitude}, name ${pickedLocation.locationName}");
  //     update();
  //   }
  // }

  // Future<void> gotoSpecificPosition(LatLng position) async {
  //   final GoogleMapController mapController = await googleMapController.future;
  //   mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: position, zoom: 13.5),
  //     ),
  //   );
  //   await getAddress(position);
  // }

  void onCameraIdle(LatLng draggedLatLng) {
    getAddress(draggedLatLng);
  }

  void onCameraMove(CameraPosition cameraPosition) {
    pickedLocation.latitude = cameraPosition.target.latitude;
    pickedLocation.longitude = cameraPosition.target.longitude;
  }

////////////////////////////////////////////////

  // Future<void> getCurrentLocation() async {
  //   Location location = Location();

  //   bool serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     await checkLocationStatus();
  //     serviceEnabled = isLocationEnabled.value;
  //   }

  //   if (serviceEnabled) {
  //     var permissionStatus = await Permission.location.request();
  //     if (permissionStatus.isGranted) {
  //       LocationData locationData = await location.getLocation();

  //       // Reverse geocoding to get the address
  //       List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
  //           locationData.latitude!, locationData.longitude!);
  //       String locationName = '';

  //       if (placemarks.isNotEmpty) {
  //         geo.Placemark placemark = placemarks[0];
  //         locationName =
  //             ' ${placemark.locality ?? ''}, ${placemark.administrativeArea ?? ''}';
  //       } else {
  //         locationName = 'Unknown location';
  //       }

  //       pickedLocation = PickedLocationModel(
  //           longitude: locationData.longitude!,
  //           latitude: locationData.latitude!,
  //           locationName: locationName);

  //       cameraPosition = CameraPosition(
  //           zoom: 13.0,
  //           target: LatLng(locationData.latitude!, locationData.longitude!));

  //       print(
  //           'Latitude: ${locationData.latitude}, Longitude: ${locationData.longitude}, Name: $locationName');
  //     } else {
  //       print('Location permission not granted');
  //     }
  //   } else {
  //     print('Location service not enabled');
  //   }
  //   update();
  // }

  // Future<void> checkLocationStatus() async {
  //   Location location = Location();

  //   bool serviceEnabled = await location.serviceEnabled();
  //   isLocationEnabled.value = serviceEnabled;

  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     isLocationEnabled.value = serviceEnabled;
  //   }
  // }

  // void updateLocation({required lat, required long, required name}) {
  //   pickedLocation.locationName = name.toString();
  //   pickedLocation.latitude = lat;
  //   pickedLocation.longitude = long;
  //   Get.back();
  // }
}
