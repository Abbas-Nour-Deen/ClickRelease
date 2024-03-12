import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/screens/provider_screens/selectedProvider_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProviderItem extends StatelessWidget {
  const ProviderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SelectedProviderScreen());
      },
      child: Container(
        width: 310,
        margin: const EdgeInsets.only(right: 10),
        // padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Get.theme.colorScheme.onSecondaryContainer),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/images/me.jpeg",
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [headerIcons(), name(), footer()],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 33),
              child: SvgPicture.asset(
                "assets/icons/call_btn.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerIcons() {
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

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
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

  Widget footer() {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(top: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    height: 12,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "3.93km away",
                    style: Get.textTheme.labelSmall!,
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.clock,
                    size: 12,
                    color: lightTHemeSecondTextColor,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "02:30PM till 06:00PM",
                    style: Get.textTheme.labelSmall!,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
