import 'dart:io';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhoto extends StatelessWidget {
  final String? imageUrl;
  final File? pickedImage;
  final String type;
  const ProfilePhoto(
      {super.key, this.imageUrl, this.pickedImage, required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: lightThemeDividerColor,
              borderRadius: BorderRadius.circular(100)),
          child: pickedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ),
                )
              : imageUrl != null && imageUrl!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: SvgPicture.asset(
                          "assets/images/person.svg",
                        ),
                      ),
                    ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: type == 'editable'
                ? SvgPicture.asset("assets/icons/edit_btn.svg")
                : Container())
      ],
    );
  }
}
