import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/favorite_screen/favorite_screen.dart';
import 'package:click_release/screens/home_screens/home_screen.dart';
import 'package:click_release/screens/profile_screens/profile_screen.dart';
import 'package:click_release/screens/search_screen/search_screen.dart';
import 'package:click_release/utils/utils.dart';
import 'package:click_release/widgets/loading_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/nabar_controller.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  final NavBarController navController =
      Get.put(NavBarController(), permanent: false);

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Utils().exitAppDialog();
        },
        child: GetBuilder<LoginController>(
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
              return Style2BottomNavBar(
                navBarConfig: p0,
                navBarDecoration: NavBarDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    border: Border(
                        top: BorderSide(
                      color: Get.theme.colorScheme.primaryContainer,
                    ))),
              );
            },
          ),
        ));
  }

  List<PersistentTabConfig> _buildScreens(context) {
    return loginController.isTokenLoading
        ? [
            PersistentTabConfig(
              screen: const LoadingScreen(),
              item: ItemConfig(
                iconSize: 25,
                icon: const Icon(
                  Icons.home,
                ),
                title: S.of(context).home,
                activeColorSecondary: Get.theme.primaryColor,
                activeForegroundColor: Colors.white,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: const LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(
                  Icons.search,
                ),
                iconSize: 25,
                title: S.of(context).search,
                activeColorSecondary: Get.theme.primaryColor,
                activeForegroundColor: Colors.white,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: const LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(CupertinoIcons.suit_heart),
                iconSize: 25,
                title: S.of(context).favorites,
                activeColorSecondary: Get.theme.primaryColor,
                activeForegroundColor: Colors.white,
                textStyle: Get.textTheme.labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            PersistentTabConfig(
              screen: const LoadingScreen(),
              item: ItemConfig(
                icon: const Icon(Icons.account_circle_outlined),
                iconSize: 25,
                title: S.of(context).profile,
                activeColorSecondary: Get.theme.primaryColor,
                activeForegroundColor: Colors.white,
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
                  title: S.of(context).home,
                  textStyle: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  activeColorSecondary: Get.theme.primaryColor,
                  activeForegroundColor: Colors.white),
            ),
            PersistentTabConfig(
              screen: SearchScreen(),
              item: ItemConfig(
                  icon: const Icon(
                    Icons.search,
                  ),
                  iconSize: 25,
                  title: S.of(context).search,
                  activeColorSecondary: Get.theme.primaryColor,
                  textStyle: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  activeForegroundColor: Colors.white),
            ),
            PersistentTabConfig(
              screen: FavoriteScreen(),
              item: ItemConfig(
                  icon: const Icon(CupertinoIcons.suit_heart),
                  iconSize: 25,
                  title: S.of(context).favorites,
                  activeColorSecondary: Get.theme.primaryColor,
                  textStyle: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  activeForegroundColor: Colors.white),
            ),
            PersistentTabConfig(
              screen: ProfileScreen(),
              item: ItemConfig(
                  icon: const Icon(Icons.account_circle_outlined),
                  iconSize: 25,
                  title: S.of(context).profile,
                  activeColorSecondary: Get.theme.primaryColor,
                  textStyle: Get.textTheme.labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  activeForegroundColor: Colors.white),
            ),
          ];
  }
}
