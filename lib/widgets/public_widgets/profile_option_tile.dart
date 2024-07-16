import 'package:click_release/theme/constant_designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileOptionTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final double? iconSize;
  const ProfileOptionTile(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: customeTileDecoration(),
        child: ListTile(
          minLeadingWidth: 15,
          titleAlignment: ListTileTitleAlignment.threeLine,
          leading: SvgPicture.asset(
            iconPath,
            colorFilter:
                ColorFilter.mode(Get.theme.iconTheme.color!, BlendMode.srcIn),
            height: iconSize ?? null,
          ),
          title: Text(
            title,
            style: Get.textTheme.titleSmall,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.0,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
