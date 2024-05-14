import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      child: SearchBar(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
            Get.theme.colorScheme.onSecondaryContainer),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        hintText: "Search",
        hintStyle:
            const MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
        leading:
            SvgPicture.asset("assets/icons/lightheme_icons/search_light.svg"),
      ),
    );
  }
}