import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  void showLocationBottomSheet() {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white),
      height: Get.height * 0.2,
      child: Container(
        child: Column(
          children: [
            ProfileOptionTile(
              title: "Your current location",
              iconPath: "assets/icons/location.svg",
              onTap: () {},
              iconSize: 20,
            ),
            ProfileOptionTile(
              title: "Enter location",
              iconPath: "assets/icons/lightheme_icons/pin.svg",
              onTap: () {
                Get.to(GoogleMapsWidget());
              },
            )
          ],
        ),
      ),
    ));
  }
}
