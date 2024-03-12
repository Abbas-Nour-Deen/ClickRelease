import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  final bool? type;
  CustomeAppBar({super.key, required this.title, this.trailing, this.type});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: type == null || type == true
          ? PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                color: lightThemeDividerColor,
                height: 1.0,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: type == null || type == true
          ? Container(
              margin: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () => Get.back(),
                child: SvgPicture.asset(
                  "assets/icons/back_btn.svg",
                ),
              ),
            )
          : null,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 12),
            child: trailing ?? Container())
      ],
      leadingWidth: 50,
      centerTitle: true,
      title: Text(
        title,
        style: Get.textTheme.titleLarge!
            .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }
}
