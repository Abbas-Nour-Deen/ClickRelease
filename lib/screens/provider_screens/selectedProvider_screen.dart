import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/controllers/providerInfo_controller.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/provider_category_icons.dart';
import 'package:click_release/widgets/selected_provider_widgets/contained_Tab.dart';
import 'package:click_release/widgets/selected_provider_widgets/expansion_tile.dart';
import 'package:click_release/widgets/socialMedia_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectedProviderScreen extends StatelessWidget {
  final ProviderModel? provider;
  const SelectedProviderScreen({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderInfoController>(
      init: ProviderInfoController(dataRepo: Get.find()),
      builder: (controller) => Scaffold(
        bottomSheet: bottomSheet(providerInfoController: controller),
        appBar: CustomeAppBar(
            title: "",
            trailing: SvgPicture.asset(
                "assets/icons/lightheme_icons/share_btn_light.svg")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: controller.obx(
                onLoading: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                (state) => Column(
                      children: [
                        providerInfo(),
                        butons(),
                        details(controller: controller),
                        about(controller: controller),
                        ContainedTabWidget(),
                        expansions(providerInfoController: controller),
                        const SizedBox(
                          height: 65,
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }

  Widget providerInfo() {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profilePhoto
              ClipRRect(
                borderRadius: provider!.profileImage == null ||
                        provider!.profileImage == ''
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(100),
                child: provider!.profileImage == null ||
                        provider!.profileImage == ''
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/person.svg",
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.network(
                        provider!.profileImage,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
              ),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProviderCategoryIcons(
                        provider: provider!,
                      ),
                      name(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget name() {
    return Container(
      margin: const EdgeInsets.only(top: 7),
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
                  provider!.providerUsername,
                  style: Get.textTheme.titleLarge,
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 3,
                ),
                SvgPicture.asset(
                  "assets/icons/Verified.svg",
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            provider!.serviceNameEng,
            style: Get.textTheme.labelSmall,
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            provider!.categoryNameEng,
            style: Get.textTheme.labelSmall!
                .copyWith(color: Get.theme.primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(
                CupertinoIcons.star_fill,
                color: Get.theme.primaryColor,
                size: 12,
              ),
              Text(
                provider!.rate!.toStringAsFixed(0),
                style: Get.textTheme.labelMedium,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget butons() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: lightThemeDividerColor))),
      margin: const EdgeInsets.only(top: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomeButton(
              height: 35,
              text: 'Like',
              icon: Icon(
                CupertinoIcons.suit_heart,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomeButton(
              height: 35,
              text: 'Rate',
              icon: Icon(
                CupertinoIcons.star,
                color: Colors.white,
                size: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget details({required ProviderInfoController controller}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: lightThemeDividerColor))),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: RichText(
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          style: Get.textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          text: "${provider!.locationEnglishName} | "),
                      TextSpan(
                          style: Get.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          text:
                              "${controller.providerController.calculateDistance(provider!.location.y, provider!.location.x).toStringAsFixed(2)} away"),
                    ])),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 18,
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          style: Get.textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          text: "08:30AM till 02:00PM - "),
                      TextSpan(
                          style: Get.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          text:
                              "${controller.currentProviderInfoModel.workingHR.first.day} ${controller.currentProviderInfoModel.workingHR.last.day}"),
                    ])),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget about({required ProviderInfoController controller}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: lightThemeDividerColor))),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            provider!.description,
            style: Get.textTheme.bodyMedium!
                .copyWith(color: lightTHemeSecondTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: provider!.facebook == null || provider!.facebook == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  svgPath: "assets/icons/lightheme_icons/facebook_light.svg",
                  onTap: () {
                    controller.providerController.launchUrls(
                        url: provider!.facebook!,
                        type: "facebook",
                        inApp: false);
                  },
                ),
              ),
              Visibility(
                visible:
                    provider!.instagram == null || provider!.instagram == ''
                        ? false
                        : true,
                child: SocialMediaButtom(
                  onTap: () {
                    controller.providerController.launchUrls(
                        url: provider!.instagram!,
                        type: "instagram",
                        inApp: false);
                  },
                  svgPath: "assets/icons/lightheme_icons/instagram_light.svg",
                ),
              ),
              Visibility(
                visible: provider!.linkedIn == null || provider!.linkedIn == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  onTap: () {
                    controller.providerController.launchUrls(
                        url: provider!.linkedIn!,
                        type: "linkedin",
                        inApp: false);
                  },
                  svgPath: "assets/icons/lightheme_icons/linkedin.svg",
                ),
              ),
              Visibility(
                visible: provider!.website == null || provider!.website == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  onTap: () {
                    controller.providerController.launchUrls(
                        url: provider!.website!, type: "website", inApp: false);
                  },
                  svgPath: "assets/icons/lightheme_icons/enternet_light.svg",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }

  Widget expansions({required ProviderInfoController providerInfoController}) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Specelities",
            options: [
              for (var info
                  in providerInfoController.currentProviderInfoModel.speciality)
                info.serviceNameEng
            ],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Working Hours",
            options: [
              for (var info
                  in providerInfoController.currentProviderInfoModel.workingHR)
                info.start
            ],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Certifications",
            options: [
              for (var info in providerInfoController
                  .currentProviderInfoModel.certification)
                info.certificationName
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomSheet({required ProviderInfoController providerInfoController}) {
    return CustomeButtomSheet(
      childrens: [
        Expanded(
          child: CustomeButton(
            icon: const Icon(
              CupertinoIcons.phone,
              color: Colors.white,
              size: 22,
            ),
            ontap: () {
              providerInfoController.providerController.launchUrls(
                  url: provider!.phoneNumber, inApp: false, type: "call");
            },
            text: "Click",
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
