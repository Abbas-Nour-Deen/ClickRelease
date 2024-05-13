import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/screens/home_screens/filterBy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeSearchBar extends StatelessWidget {
  final SearchProviderController searchController;
  final EdgeInsets? margin;
  const CustomeSearchBar(
      {super.key, required this.searchController, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: SearchBar(
        onSubmitted: (value) {
          searchController.getProvidersBySearch(keyWord: value);
        },
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
