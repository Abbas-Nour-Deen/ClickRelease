import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: Get.theme.colorScheme.onSecondaryContainer),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/serv_icon.svg",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Text(
            "Home Essentials",
            textAlign: TextAlign.center,
            style: Get.textTheme.labelMedium,
          ))
        ],
      ),
    );
  }
}
