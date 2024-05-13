import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProviderCategoryIcons extends StatelessWidget {
  const ProviderCategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/serv_icon.svg",
          height: 14,
        ),
        const SizedBox(
          width: 7,
        ),
        SvgPicture.asset(
          "assets/icons/individual.svg",
          height: 14,
        )
      ],
    );
  }
}
