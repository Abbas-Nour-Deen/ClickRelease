import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarForNavBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppBarForNavBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: lightThemeDividerColor,
          height: 1.0,
          margin: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
      title: Image.asset('assets/images/clickLogo.png', height: 80),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
    );
  }
}
