import 'package:click_release/widgets/public_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: "Contact Us"),
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
            onTap: () {},
          ),
          ProfileOptionTile(
            title: "WhatsApp",
            iconPath: "assets/icons/lightheme_icons/whatsappicon.svg",
            onTap: () {},
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
            onTap: () {},
            iconSize: 24,
          ),
          ProfileOptionTile(
            title: "Instagram",
            iconPath: "assets/icons/lightheme_icons/instagram_light.svg",
            onTap: () {},
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
