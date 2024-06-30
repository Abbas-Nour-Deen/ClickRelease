import 'package:click_release/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DefaultSearchBar extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onChanged;
  const DefaultSearchBar(
      {super.key, required this.textController, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      child: SearchBar(
        onChanged: onChanged,
        controller: textController,
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor:
            WidgetStatePropertyAll(Get.theme.colorScheme.onSecondaryContainer),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        hintText: S.of(context).search,
        hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
        leading:
            SvgPicture.asset("assets/icons/lightheme_icons/search_light.svg"),
      ),
    );
  }
}
