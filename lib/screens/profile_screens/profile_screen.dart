import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/profile_screens/contact_us.dart';
import 'package:click_release/screens/profile_screens/editProfile_screen.dart';
import 'package:click_release/screens/profile_screens/settings_screen.dart';
import 'package:click_release/utils/utils.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController loginController = Get.find();
  final NavBarController navBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: S.of(context).profile, type: false),
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
                tilesWidgets(context),
                const SizedBox(
                  height: 70,
                ),
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
            pickedImage: loginController.savedPickedProfilePhoto,
          ),
        ),
      ),
    );
  }

  Widget tilesWidgets(BuildContext context) {
    return Column(
      children: [
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/user_icon.svg",
          onTap: () {
            Get.to(EditProfileScreen(
              loginController: loginController,
            ));
          },
          title: S.of(context).myProfile,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {
            Utils().becomeAserviceProviderWidget(context);
          },
          title: S.of(context).becomeaserviceprovider,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/invitefriends.svg",
          onTap: () {},
          title: S.of(context).inviteFriends,
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/address.svg",
          onTap: () {
            Utils().showLocationBottomSheet();
          },
          title: S.of(context).manageAddress,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/fav.svg",
          onTap: () {
            navBarController.tabController.jumpToTab(2);
          },
          title: S.of(context).myFavorites,
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {},
          title: S.of(context).aboutUs,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/privacypolicy.svg",
          onTap: () {},
          title: S.of(context).privacyPolicy,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/termscondition.svg",
          onTap: () {},
          title: S.of(context).termsconditions,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/contactus.svg",
          onTap: () => Get.to(const ContactUsScreen()),
          title: S.of(context).contactUS,
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/settingss.svg",
          onTap: () {
            Get.to(SettingsScreen());
          },
          title: S.of(context).settings,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/logout.svg",
          onTap: () {},
          title: S.of(context).logout,
        ),
      ],
    );
  }
}
