import 'package:click_release/controllers/defaults_controller.dart';
import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/contact_us.dart';
import 'package:click_release/screens/editProfile_screen.dart';
import 'package:click_release/screens/settings_screen.dart';
import 'package:click_release/utils/utils.dart';
import 'package:click_release/widgets/custome_drawer.dart';
import 'package:click_release/widgets/navbar_appbar.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:click_release/widgets/public_widgets/profile_option_tile.dart';
import 'package:click_release/widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController loginController = Get.find();
  final NavBarController navBarController = Get.find();
  final DefaultsController defaultsController = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        key: _scaffoldKey,
        appBar: AppBarForNavBar(
          scaffoldKey: _scaffoldKey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profilePhoto(),
                GetBuilder<LoginController>(
                    id: 'profilePhoto',
                    builder: (controller) => Text(
                          "${loginController.currentUser.clientUsername}",
                          style: Get.textTheme.titleLarge,
                        )),
                const SizedBox(
                  height: 10,
                ),
                tilesWidgets(context),
                const SizedBox(
                  height: 20,
                ),
                poweredByWidget(),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ));
  }

  Widget poweredByWidget() {
    return Container(
      child: InkWell(
        onTap: () async {
          final url = Uri.parse("https://www.hisoftlb.com/");
          if (await canLaunchUrl(url)) {
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Powered by",
              style: Get.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Container(
                width: 80, height: 70, child: Image.asset("assets/hisoft.png"))
          ],
        ),
      ),
    );
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
            Utils().becomeAserviceProviderWidget(
                context,
                defaultsController.defaultsList
                    .where(
                      (element) => element.name == 'phoneNumber',
                    )
                    .first
                    .number);
          },
          title: S.of(context).becomeaserviceprovider,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/invitefriends.svg",
          onTap: () {
            loginController.shareApp("Download click app");
          },
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
          onTap: () {
            loginController.launchUrls(type: 'aboutus');
          },
          title: S.of(context).aboutUs,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/privacypolicy.svg",
          onTap: () {
            loginController.launchUrls(type: 'privacypolicy');
          },
          title: S.of(context).privacyPolicy,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/termscondition.svg",
          onTap: () {
            loginController.launchUrls(type: 'termsandconditions');
          },
          title: S.of(context).termsconditions,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/contactus.svg",
          onTap: () => Get.to(ContactUsScreen()),
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
          iconPath: "assets/icons/trash.svg",
          onTap: () {
            Utils().deleteAccountDialog();
          },
          title: S.of(context).deleteAccount,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/logout.svg",
          onTap: () {
            loginController.logOut();
          },
          title: S.of(context).logout,
        ),
      ],
    );
  }
}
