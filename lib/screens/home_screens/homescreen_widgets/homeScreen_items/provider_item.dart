import 'package:click_release/controllers/provider_calculation_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/screens/provider_screens/selectedProvider_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/call_btn_widget.dart';
import 'package:click_release/widgets/provider_category_icons.dart';
import 'package:click_release/widgets/provider_name_widget.dart';
import 'package:click_release/widgets/public_widgets/likeButton_widget.dart';
import 'package:click_release/widgets/public_widgets/provider_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProviderItem extends StatelessWidget {
  final double? width;
  final EdgeInsets margin;
  final ProviderModel provider;
  ProviderItem(
      {super.key, this.width, required this.margin, required this.provider});

  final ProviderController _providerController = Get.find();

  final ProviderCalculations providerCalculations = Get.find();

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
                Stack(
                  children: [
                    Container(
                        width: 80,
                        height: 100,
                        margin: _providerController.localizationController
                                    .selectedLang.value ==
                                'en'
                            ? const EdgeInsets.only(right: 10)
                            : const EdgeInsets.only(left: 10),
                        child: ProviderProfilePhotoWidget(
                            imageurl: provider.profileImage, type: 'provItem')),
                    LikeButtunWidget(
                      provider: provider,
                    )
                    // LikeButtunWidget(provider: provider)
                  ],
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
                          footer(context)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                margin: _providerController
                            .localizationController.selectedLang.value ==
                        'en'
                    ? const EdgeInsets.only(right: 10)
                    : const EdgeInsets.only(left: 10),
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

  Widget footer(BuildContext context) {
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
                    "${providerCalculations.calculateDistance(provider.location.y, provider.location.x).toStringAsFixed(2)} ${S.of(context).Km} ${S.of(context).away} ",
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
                    "${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.start))} till ${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.end))}",
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
