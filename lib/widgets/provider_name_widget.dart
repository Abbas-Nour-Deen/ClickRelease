import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProviderNameWidget extends StatelessWidget {
  const ProviderNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Dr.Abbas Nour Deen",
                  style: Get.textTheme.titleSmall,
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 3,
                ),
                SvgPicture.asset(
                  "assets/icons/Verified.svg",
                  height: 14,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "Plastic Surgeon",
                style: Get.textTheme.labelSmall,
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                CupertinoIcons.star_fill,
                color: Get.theme.primaryColor,
                size: 12,
              ),
              Text(
                "4.5",
                style: Get.textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold, color: Get.theme.primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
