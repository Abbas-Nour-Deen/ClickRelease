import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/screens/profile_screens/contact_us.dart';
import 'package:click_release/screens/profile_screens/editProfile_screen.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController loginController = Get.find();

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
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: GetBuilder<LoginController>(
          id: 'profilePhoto',
          dispose: (state) => loginController.pickedProfilePhoto = null,
          builder: (controller) => ProfilePhoto(
            type: 'noteditable',
            imageUrl: loginController.currentUser.profilePhoto,
            pickedImage: loginController.pickedProfilePhoto,
          ),
        ),
      ),
    );
  }

  Widget tilesWidgets() {
    return Column(
      children: [
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/user_icon.svg",
          onTap: () {
            Get.to(EditProfileScreen(
              loginController: loginController,
            ));
          },
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
          onTap: () => Get.to(const ContactUsScreen()),
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
