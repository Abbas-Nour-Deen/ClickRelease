import 'package:click_release/controllers/location_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/google_maps.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final LocationController _locationController = Get.find();

final ProviderController providerController = Get.find();

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
              title: S.of(Get.context!).Yourcurrentlocation,
              iconPath: "assets/icons/location.svg",
              onTap: () async {
                await _locationController
                    .determineUserCurrentPosition()
                    .then((value) => Get.back());
              },
              iconSize: 20,
            ),
            ProfileOptionTile(
              title: S.of(Get.context!).Enterlocation,
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

  void becomeAserviceProviderWidget(BuildContext context) {
    Get.dialog(AlertDialog.adaptive(
      backgroundColor: Get.theme.primaryColor,
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            Text(
              S.of(context).Becomeaserviceprovider,
              style: Get.textTheme.bodyLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).Callusformoreinformation,
              style: Get.textTheme.labelSmall!.copyWith(
                color: Colors.white,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                providerController.launchUrls(
                    url: '81851410', inApp: false, type: 'call');
              },
              child: SvgPicture.asset(
                  "assets/icons/lightheme_icons/call_btn_2.svg"),
            ),
          ],
        ),
      ),
    ));
  }

  bool exitAppDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          S.of(context).exit,
          style: Get.textTheme.titleMedium,
        ),
        content: Text(S.of(context).areyousureyouwanttoexittheapp),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                S.of(context).cancel,
                style: TextStyle(color: Get.theme.primaryColor),
              )),
          const SizedBox(
            width: 3,
          ),
          CustomeButton(
            width: 50,
            text: S.of(context).ok,
            ontap: () {
              FlutterExitApp.exitApp(iosForceExit: true);
            },
            height: 40,
            margin: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
    return false;
  }
}
