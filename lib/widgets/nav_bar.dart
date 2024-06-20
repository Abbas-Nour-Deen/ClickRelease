import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/screens/favorite_screen/favorite_screen.dart';
import 'package:click_release/screens/home_screens/home_screen.dart';
import 'package:click_release/screens/profile_screens/profile_screen.dart';
import 'package:click_release/screens/search_screen/search_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/loading_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/nabar_controller.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  NavBarController navController =
      Get.put(NavBarController(), permanent: false);

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        initState: (state) => loginController.getUserByID(),
        builder: (controller) => PersistentTabView(
              controller: navController.tabController,
              backgroundColor: Get.theme.scaffoldBackgroundColor,
              resizeToAvoidBottomInset: true,
              handleAndroidBackButtonPress: true,
              stateManagement: true,
              popActionScreens: PopActionScreensType.all,
              navBarHeight: 63,
              screenTransitionAnimation: const ScreenTransitionAnimation(
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              onTabChanged: (value) {},
              tabs: _buildScreens(context),
              navBarBuilder: (p0) {
                return Style12BottomNavBar(
                  navBarConfig: p0,
                  navBarDecoration: NavBarDecoration(
                      color: Get.theme.scaffoldBackgroundColor,
                      border: Border(
                          top: BorderSide(
                        color: Get.theme.colorScheme.primaryContainer,
                      ))),
                );
              },
            )

        // PersistentTabView(
        //       context,
        //       controller: navController.tabController,
        //       screens: _buildScreens(),
        //       items: _navBarsItems(context),
        //       confineInSafeArea: true,
        //       decoration: NavBarDecoration(
        //           border: Border(
        //               top: BorderSide(
        //         color: Get.isDarkMode
        //             ? const Color(0xFF2A3139)
        //             : lightThemeDividerColor,
        //       ))),
        //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //       handleAndroidBackButtonPress: true,
        //       resizeToAvoidBottomInset: true,
        //       stateManagement: true,
        //       hideNavigationBarWhenKeyboardShows: true,
        //       popAllScreensOnTapOfSelectedTab: true,
        //       popActionScreens: PopActionScreensType.all,
        //       itemAnimationProperties: const ItemAnimationProperties(
        //         duration: Duration(milliseconds: 200),
        //         curve: Curves.ease,
        //       ),
        //       screenTransitionAnimation: const ScreenTransitionAnimation(
        //         animateTabTransition: true,
        //         curve: Curves.ease,
        //         duration: Duration(milliseconds: 200),
        //       ),
        //       navBarStyle: NavBarStyle.style1,
        //       navBarHeight: 63,
        //     )

        );
  }

  List<PersistentTabConfig> _buildScreens(context) {
    return loginController.isTokenLoading
        ? [
            PersistentTabConfig(
              screen: LoadingScreen(),
              item: ItemConfig(
                iconSize: 25,
                icon: const Icon(
                  Icons.home,
                ),
                title: ("Home"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(
                  Icons.search,
                ),
                iconSize: 25,
                title: ("Search"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(CupertinoIcons.suit_heart),
                iconSize: 25,
                title: ("Favorites"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.account_circle_outlined),
                iconSize: 25,
                title: ("Profile"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ]
        : [
            PersistentTabConfig(
              screen: HomeScreen(),
              item: ItemConfig(
                iconSize: 25,
                icon: const Icon(
                  Icons.home,
                ),
                title: ("Home"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: SearchScreen(),
              item: ItemConfig(
                icon: const Icon(
                  Icons.search,
                ),
                iconSize: 25,
                title: ("Search"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: FavoriteScreen(),
              item: ItemConfig(
                icon: const Icon(CupertinoIcons.suit_heart),
                iconSize: 25,
                title: ("Favorites"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: ProfileScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.account_circle_outlined),
                iconSize: 25,
                title: ("Profile"),
                activeColorSecondary:
                    Get.isDarkMode ? Colors.white : Colors.black,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ];
  }

  // List<Widget> _buildScreens() {
  //   return loginController.isTokenLoading
  //       ? const [
  //           LoadingScreen(),
  //           LoadingScreen(),
  //           LoadingScreen(),
  //           LoadingScreen()
  //         ]
  //       : [HomeScreen(), SearchScreen(), FavoriteScreen(), ProfileScreen()];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems(context) {
  //   return [
  //     PersistentBottomNavBarItem(
  //       iconSize: 25,
  //       icon: const Icon(Icons.search),
  //       title: ("Search"),
  //       activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
  //       textStyle:
  //           Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
  //       activeColorPrimary: Get.theme.primaryColor,
  //       inactiveColorPrimary: Get.isDarkMode
  //           ? CupertinoColors.systemGrey
  //           : CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       iconSize: 25,
  //       icon: const Icon(CupertinoIcons.suit_heart),
  //       title: ("Favorites"),
  //       activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
  //       textStyle:
  //           Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
  //       activeColorPrimary: Get.theme.primaryColor,
  //       inactiveColorPrimary: Get.isDarkMode
  //           ? CupertinoColors.systemGrey
  //           : CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       iconSize: 25,
  //       icon: const Icon(Icons.account_circle_outlined),
  //       title: ("Profile"),
  //       activeColorSecondary: Get.isDarkMode ? Colors.white : Colors.black,
  //       textStyle:
  //           Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
  //       activeColorPrimary: Get.theme.primaryColor,
  //       inactiveColorPrimary: Get.isDarkMode
  //           ? CupertinoColors.systemGrey
  //           : CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }
}
