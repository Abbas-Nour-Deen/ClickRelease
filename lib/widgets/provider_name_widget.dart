import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProviderNameWidget extends StatelessWidget {
  final ProviderModel provider;
  ProviderNameWidget({super.key, required this.provider});

  final LocalizationController localizationController = Get.find();

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
                  provider.firstName,
                  style: Get.textTheme.titleSmall,
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 3,
                ),
                Visibility(
                  visible: provider.verified == 0 ? false : true,
                  child: SvgPicture.asset(
                    "assets/icons/Verified.svg",
                    height: 14,
                  ),
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
                localizationController.selectedLang.value == 'en'
                    ? provider.serviceNameEng
                    : provider.serviceNameArb,
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
                provider.rate!.toStringAsFixed(0),
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
