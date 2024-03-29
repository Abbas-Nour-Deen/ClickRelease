import 'package:click_release/screens/favorite_screen.dart';
import 'package:click_release/screens/home_screens/home_screen.dart';
import 'package:click_release/screens/profile_screens/profile_screen.dart';
import 'package:click_release/screens/search_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/nabar_controller.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  NavBarController navController = Get.put(NavBarController());

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
          border: Border(
              top: BorderSide(
        color:
            Get.isDarkMode ? const Color(0xFF2A3139) : lightThemeDividerColor,
      ))),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 63,
    );
  }

  List<Widget> _buildScreens() {
    return [HomeScreen(), FavoriteScreen(), SearchScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        iconSize: 25,
        icon: const Icon(
          Icons.home,
        ),
        title: ("Home"),
        activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
        textStyle:
            Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Get.isDarkMode
            ? CupertinoColors.systemGrey
            : CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 25,
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
        textStyle:
            Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Get.isDarkMode
            ? CupertinoColors.systemGrey
            : CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 25,
        icon: const Icon(CupertinoIcons.suit_heart),
        title: ("Favorites"),
        activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
        textStyle:
            Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Get.isDarkMode
            ? CupertinoColors.systemGrey
            : CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 25,
        icon: const Icon(Icons.account_circle_outlined),
        title: ("Profile"),
        activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
        textStyle:
            Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
        activeColorPrimary: Get.theme.primaryColor,
        inactiveColorPrimary: Get.isDarkMode
            ? CupertinoColors.systemGrey
            : CupertinoColors.systemGrey,
      ),
    ];
  }
}
