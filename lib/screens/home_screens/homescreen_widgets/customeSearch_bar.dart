import 'package:click_release/controllers/search_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/screens/search_screen/filterBy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeSearchBar extends StatelessWidget {
  final EdgeInsets? margin;
  CustomeSearchBar({super.key, this.margin});

  final SearchProviderController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: SearchBar(
        controller: searchController.searchTextController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            searchController.getProvidersBySearch(keyWord: value);
          }
        },
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor:
            WidgetStatePropertyAll(Get.theme.colorScheme.onSecondaryContainer),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        hintText: S.of(context).searchbynameorkeyword,
        hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
        leading:
            SvgPicture.asset("assets/icons/lightheme_icons/search_light.svg"),
        trailing: [
          InkWell(
              onTap: () => Get.to(() => FilterByScreen()),
              child: SvgPicture.asset(
                  "assets/icons/lightheme_icons/filter_icon.svg"))
        ],
      ),
    );
  }
}
