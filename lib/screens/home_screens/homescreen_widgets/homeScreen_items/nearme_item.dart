import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/screens/provider_screens/selectedProvider_screen.dart';
import 'package:click_release/widgets/public_widgets/call_btn_widget.dart';
import 'package:click_release/widgets/provider_category_icons.dart';
import 'package:click_release/widgets/provider_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NearMeItem extends StatelessWidget {
  NearMeItem({super.key});

  final ProviderController _providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(SelectedProviderScreen());
      },
      child: Container(
          width: 160,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Get.theme.colorScheme.onSecondaryContainer),
          child: Column(
            children: [
              image(),
              Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: ProviderCategoryIcons(
                    provider: _providerController.selectedProvider,
                  )),
              ProviderNameWidget(
                provider: _providerController.selectedProvider,
              ),
              details()
            ],
          )),
    );
  }

  Widget image() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/me.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 100,
          ),
          Positioned(
              top: 5,
              left: 5,
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: SvgPicture.asset(
                    "assets/icons/lightheme_icons/fav.svg",
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget details() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const CallButtonWidget(
            size: 35,
            margin: EdgeInsets.all(0),
          )
        ],
      ),
    );
  }
}
