import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/screens/allCategories_screens/allcategories_screen.dart';
import 'package:click_release/screens/allServices_screens/allServices_screen.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_option_tile.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/customedivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 7),
            height: 50,
            child: Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 2, color: lightThemeDividerColor))),
              child: Center(
                  child: Image.asset(
                "assets/images/clickLogo.png",
                scale: 0.8,
              )),
            ),
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
          title: "Home",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/fav.svg",
          onTap: () {},
          title: "My Favorites",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/user_icon.svg",
          onTap: () {},
          title: "My Profile",
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/categoriesicon.svg",
          onTap: () => Get.to(AllCategoriesScreen()),
          title: "Categories",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/servicesicon.svg",
          onTap: () => Get.to(AllServicesScreen(
            servicesController: Get.find<AllServicesController>(),
          )),
          title: "Services",
        ),
        const CustomeDivider(),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/aboutus.svg",
          onTap: () {},
          title: "Become a service provider",
        ),
        ProfileOptionTile(
          iconPath: "assets/icons/lightheme_icons/contactus.svg",
          onTap: () {},
          title: "Help Center",
        ),
      ],
    );
  }
}
