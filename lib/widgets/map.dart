// import 'package:click_release/controllers/location_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

// class MapWidget extends StatelessWidget {
//   MapWidget({super.key});

//   final LocationController _locationController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: FlutterLocationPicker(
//         markerIcon: Icon(
//           Icons.location_pin,
//           color: Get.theme.primaryColor,
//           size: 50,
//         ),
//         selectLocationButtonStyle: ButtonStyle(
//             backgroundColor: MaterialStatePropertyAll(Get.theme.primaryColor)),
//         searchbarDebounceDuration: const Duration(milliseconds: 1),
//         countryFilter: 'LB',
//         initZoom: 11,
//         minZoomLevel: 5,
//         maxZoomLevel: 16,
//         zoomButtonsColor: Colors.white,
//         zoomButtonsBackgroundColor: Get.theme.primaryColor,
//         locationButtonsColor: Colors.white,
//         locationButtonBackgroundColor: Get.theme.primaryColor,
//         trackMyPosition: true,
//         searchBarBackgroundColor: Colors.white,
//         selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
//         mapLanguage: 'en',
//         onError: (e) => print(e),
//         selectLocationButtonLeadingIcon: const Icon(Icons.check),
//         onPicked: (pickedData) {
//           List<String> addressParts = pickedData.address.split(',');

//           // Take the first two parts
//           String shortenedAddress = addressParts.getRange(0, 2).join(',');
//           _locationController.updateLocation(
//               lat: pickedData.latLong.latitude,
//               long: pickedData.latLong.longitude,
//               name: shortenedAddress);
//           _locationController.update();
//         },
//         onChanged: (pickedData) {
//           print(pickedData.latLong.latitude);
//           print(pickedData.latLong.longitude);
//           print(pickedData.address);
//           print(pickedData.addressData);
//         },
//         showContributorBadgeForOSM: false,
//       ),
//     );
//   }
// }
