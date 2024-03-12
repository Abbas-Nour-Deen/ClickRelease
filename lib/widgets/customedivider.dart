import 'package:click_release/theme/constant_designs.dart';
import 'package:flutter/material.dart';

class CustomeDivider extends StatelessWidget {
  final double? width;
  final double? height;

  const CustomeDivider({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customContainerDecoration(),
      width: width ?? double.infinity,
      height: height ?? 5,
    );
  }
}
