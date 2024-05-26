import 'package:cached_network_image/cached_network_image.dart';
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
  final ProviderModel provider;
  ProviderItem(
      {super.key, this.width, required this.margin, required this.provider});

  final ProviderController _providerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _providerController.selectedProvider = provider;
        Get.to(SelectedProviderScreen(
          provider: provider,
        ));
      },
      child: Container(
        width: width ?? 310,
        margin: margin,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Get.theme.colorScheme.onSecondaryContainer),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 100,
                  margin: const EdgeInsets.only(right: 10),
                  child: provider.profileImage == null ||
                          provider.profileImage == ''
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/images/person.svg"),
                        )
                      : CachedNetworkImage(
                          imageUrl: provider.profileImage,
                          fit: BoxFit.fill,
                        ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProviderCategoryIcons(
                            provider: provider,
                          ),
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
                      url: provider.phoneNumber.toString(),
                      type: "call",
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
      margin: const EdgeInsets.only(top: 5),
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
                    "${_providerController.calculateDistance(provider.location.y, provider.location.x).toStringAsFixed(2)} away",
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
