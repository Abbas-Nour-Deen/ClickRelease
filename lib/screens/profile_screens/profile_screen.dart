import 'package:click_release/widgets/appBar.dart';
import 'package:click_release/widgets/customedivider.dart';
import 'package:click_release/widgets/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/profileScreen_widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: "Profile", type: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profilePhoto(),
                const SizedBox(
                  height: 10,
                ),
                tilesWidgets()
              ],
            ),
          ),
        ));
  }

  Widget profilePhoto() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const ProfilePhoto(),
          const SizedBox(
            height: 13,
          ),
          Text(
            "Abbas Nour Deen",
            style: Get.textTheme.titleMedium,
          )
        ],
      ),
    );
  }

  Widget tilesWidgets() {
    return Column(
      children: [
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/user_icon.svg",
          onTap: () {},
          title: "My Profile",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {},
          title: "Become a service provider",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/invitefriends.svg",
          onTap: () {},
          title: "Invite friends",
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/address.svg",
          onTap: () {},
          title: "Manage Address",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/fav.svg",
          onTap: () {},
          title: "My Favorites",
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {},
          title: "About us",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/privacypolicy.svg",
          onTap: () {},
          title: "Privacy policy",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/termscondition.svg",
          onTap: () {},
          title: "Terms & conditions",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/contactus.svg",
          onTap: () {},
          title: "Contact us",
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/settingss.svg",
          onTap: () {},
          title: "Settings",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/logout.svg",
          onTap: () {},
          title: "Log out",
        ),
      ],
    );
  }
}
