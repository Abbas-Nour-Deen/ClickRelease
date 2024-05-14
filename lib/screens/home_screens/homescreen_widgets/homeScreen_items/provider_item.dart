import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/screens/provider_screens/selectedProvider_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/call_btn_widget.dart';
import 'package:click_release/widgets/provider_category_icons.dart';
import 'package:click_release/widgets/provider_name_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProviderItem extends StatelessWidget {
  final double? width;
  final EdgeInsets margin;
  final ProviderModel? provider;
  ProviderItem({super.key, this.width, required this.margin, this.provider});

  final ProviderController _providerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SelectedProviderScreen());
      },
      child: Container(
        width: width ?? 310,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Get.theme.colorScheme.onSecondaryContainer),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                        children: [
                          const ProviderCategoryIcons(),
                          const SizedBox(
                            height: 3,
                          ),
                          ProviderNameWidget(
                            provider: provider,
                          ),
                          footer()
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: CallButtonWidget(
                  onTap: () => _providerController.launchUrls(
                      url: Uri.parse('tel:${provider?.phoneNumber}'),
                      inApp: false),
                ))
          ],
        ),
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
