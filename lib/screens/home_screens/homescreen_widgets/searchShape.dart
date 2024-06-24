import 'package:click_release/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchShape extends StatelessWidget {
  const SearchShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: SearchBar(
        controller: TextEditingController(),
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
          SvgPicture.asset("assets/icons/lightheme_icons/filter_icon.svg")
        ],
      ),
    );
  }
}
