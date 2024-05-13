import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/images/me.jpeg",
            height: 110,
            width: 110,
            fit: BoxFit.cover,
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
