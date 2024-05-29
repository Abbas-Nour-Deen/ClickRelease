import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhoto extends StatelessWidget {
  final String? imageUrl;
  const ProfilePhoto({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: lightThemeDividerColor,
              borderRadius: BorderRadius.circular(100)),
          child: imageUrl == null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: SvgPicture.asset(
                    "assets/images/person.svg",
                  ),
                )
              : Image.network(
                  imageUrl!,
                  fit: BoxFit.fill,
                ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset("assets/icons/edit_btn.svg")),
      ],
    );
  }
}
