import 'package:click_release/screens/home_screens/filterBy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: SearchBar(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
            Get.theme.colorScheme.onSecondaryContainer),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        hintText: "Search by name or keyword",
        hintStyle:
            const MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
        leading:
            SvgPicture.asset("assets/icons/lightheme_icons/search_light.svg"),
        trailing: [
          InkWell(
              onTap: () => Get.to(() => const FilterByScreen()),
              child: SvgPicture.asset(
                  "assets/icons/lightheme_icons/filter_icon.svg"))
        ],
      ),
    );
  }
}
