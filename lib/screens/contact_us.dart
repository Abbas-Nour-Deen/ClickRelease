import 'package:click_release/controllers/defaults_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final DefaultsController defaultsController = Get.find();
  final ProviderController providerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: S.of(context).contactUS),
      body: SingleChildScrollView(child: tilesWidgets()),
    );
  }

  Widget tilesWidgets() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          ProfileOptionTile(
            title: "Customer Service",
            iconPath: "assets/icons/lightheme_icons/customerserviceicon.svg",
            onTap: () {
              providerController.launchUrls(
                  url: defaultsController.defaultsList
                      .where(
                        (element) => element.name == 'phoneNumber',
                      )
                      .first
                      .number,
                  inApp: false,
                  type: 'call');
            },
          ),
          ProfileOptionTile(
            title: "WhatsApp",
            iconPath: "assets/icons/lightheme_icons/whatsappicon.svg",
            onTap: () {
              providerController.launchUrls(
                  url: defaultsController.defaultsList
                      .where(
                        (element) => element.name == 'phoneNumber',
                      )
                      .first
                      .number,
                  inApp: false,
                  type: 'whatsapp');
            },
          ),
          ProfileOptionTile(
            title: "Website",
            iconPath: "assets/icons/lightheme_icons/enternet_light.svg",
            onTap: () {},
            iconSize: 24,
          ),
          ProfileOptionTile(
            title: "Facebook",
            iconPath: "assets/icons/lightheme_icons/facebook_light.svg",
            onTap: () {
              providerController.launchUrls(
                  url: defaultsController.defaultsList
                      .where(
                        (element) => element.name == 'facebook',
                      )
                      .first
                      .text,
                  inApp: false,
                  type: 'facebook');
            },
            iconSize: 24,
          ),
          ProfileOptionTile(
            title: "Instagram",
            iconPath: "assets/icons/lightheme_icons/instagram_light.svg",
            onTap: () {
              providerController.launchUrls(
                  url: defaultsController.defaultsList
                      .where(
                        (element) => element.name == 'instagram',
                      )
                      .first
                      .text,
                  inApp: false,
                  type: 'instagram');
            },
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
