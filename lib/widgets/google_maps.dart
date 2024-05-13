import 'package:click_release/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class GoogleMapsWidget extends StatelessWidget {
  GoogleMapsWidget({super.key});

  final LocationController locationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (_) {
          return Stack(
            children: [
              _getMap(),
              _getCustomPin(),
              _showDraggedAddress(locationController.draggedAddress),
            ],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => locationController.gotoUserCurrentPosition(),
      //   child: const Icon(Icons.location_on),
      // ),
    );
  }
}

Widget _getMap() {
  return GetBuilder<LocationController>(
    builder: (locationController) {
      return GoogleMap(
        initialCameraPosition: locationController.cameraPosition!,
        mapType: MapType.normal,
        onCameraIdle: () {
          locationController.onCameraIdle(LatLng(
              locationController.pickedLocation.latitude,
              locationController.pickedLocation.longitude));
        },
        onCameraMove: (cameraPosition) {
          locationController.onCameraMove(cameraPosition);
        },
        onMapCreated: (GoogleMapController controller) {
          if (!locationController.googleMapController.isCompleted) {
            locationController.googleMapController.complete(controller);
          }
        },
      );
    },
  );
}

Widget _getCustomPin() {
  return Center(
    child: SizedBox(
      width: 150,
      child: Lottie.asset("assets/animations/pin.json"),
    ),
  );
}

Widget _showDraggedAddress(String address) {
  return SafeArea(
    child: Container(
      width: MediaQuery.of(Get.context!).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
      ),
      child: Center(
        child: Text(
          address,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
