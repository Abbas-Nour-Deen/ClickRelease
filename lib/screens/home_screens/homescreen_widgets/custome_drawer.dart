import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/controllers/nabar_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/allCategories_screens/allcategories_screen.dart';
import 'package:click_release/screens/allServices_screens/allServices_screen.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/utils/utils.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final NavBarController navBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 2, color: lightThemeDividerColor))),
            child: Center(
                child: Image.asset(
              'assets/images/clickLogo.png',
              height: 90,
            )),
          ),
          tilesWidgets(context)
        ],
      ),
    );
  }

  Widget tilesWidgets(context) {
    return Column(
      children: [
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/homeicon.svg",
          onTap: () => Navigator.of(context).pop(),
          title: S.of(context).home,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/fav.svg",
          onTap: () {
            navBarController.tabController.jumpToTab(2);
          },
          title: S.of(context).myFavorites,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/user_icon.svg",
          onTap: () {
            navBarController.tabController.jumpToTab(3);
          },
          title: S.of(context).myProfile,
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/categoriesicon.svg",
          onTap: () => Get.to(AllCategoriesScreen()),
          title: S.of(context).categories,
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/servicesicon.svg",
          onTap: () => Get.to(AllServicesScreen(
            servicesController: Get.find<AllServicesController>(),
          )),
          title: S.of(context).services,
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {
            Utils().becomeAserviceProviderWidget(context);
          },
          title: S.of(context).becomeaserviceprovider,
        ),
        // ProfileOptionTile(
        //   iconPath: "assets/icons/lightheme_icons/contactus.svg",
        //   onTap: () {},
        //   title: S.of(context).helpCenter,
        // ),
      ],
    );
  }
}
