import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomeButtomSheet extends StatelessWidget {
  final List<Widget> childrens;

  const CustomeButtomSheet({super.key, required this.childrens});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(width: 1, color: lightThemeDividerColor))),
      child: Row(
        children: childrens,
      ),
    );
  }
}
