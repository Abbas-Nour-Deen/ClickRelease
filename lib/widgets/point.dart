import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CirclePoint extends StatelessWidget {
  const CirclePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: 5,
      decoration: BoxDecoration(
          color: lightTHemeSecondTextColor,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
