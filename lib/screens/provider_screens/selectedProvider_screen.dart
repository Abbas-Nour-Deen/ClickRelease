import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/controllers/providerInfo_controller.dart';
import 'package:click_release/controllers/provider_calculation_controller.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:click_release/screens/provider_screens/add_review_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/utils/utils.dart';
import 'package:click_release/widgets/point.dart';
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
import 'package:intl/intl.dart';

class SelectedProviderScreen extends StatelessWidget {
  final ProviderModel provider;
  SelectedProviderScreen({super.key, required this.provider});

  final ProviderCalculations providerCalculations = Get.find();
  final ProviderController providerConteroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProviderInfoController>(
      initState: (state) => providerConteroller.providerInfoController
          .fetchData(providerID: provider.provid),
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
                        butons(context),
                        details(controller: controller, context: context),
                        about(controller: controller, context: context),
                        ContainedTabWidget(),
                        expansions(
                            providerInfoController: controller,
                            context: context),
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
                        provider.profileImage == ''
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(100),
                child:
                    provider.profileImage == null || provider.profileImage == ''
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
                            provider.profileImage,
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
                        provider: provider,
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
                  provider.providerUsername,
                  style: Get.textTheme.titleLarge,
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 3,
                ),
                Visibility(
                  visible: provider.verified == 0 ? false : true,
                  child: SvgPicture.asset(
                    "assets/icons/Verified.svg",
                    height: 20,
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
                providerController.localizationController.selectedLang.value ==
                        'en'
                    ? provider.categoryNameEng
                    : provider.categoryNameArb,
                style: Get.textTheme.labelSmall,
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                CupertinoIcons.star_fill,
                color: Get.theme.primaryColor,
                size: 10,
              ),
              Text(
                provider.rate!.toStringAsFixed(0),
                style: Get.textTheme.labelMedium!.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            providerController.localizationController.selectedLang.value == 'en'
                ? provider.serviceNameEng
                : provider.serviceNameArb,
            style: Get.textTheme.labelSmall!
                .copyWith(color: Get.theme.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget butons(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: lightThemeDividerColor))),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GetBuilder<ProviderController>(
              id: 'likebtn',
              builder: (controller) => CustomeButton(
                textStyle: Get.textTheme.titleLarge!.copyWith(
                    color: provider.isLiked
                        ? Get.theme.primaryColor
                        : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                color: provider.isLiked ? Get.theme.secondaryHeaderColor : null,
                ontap: () {
                  providerConteroller.likeProvider(
                      provider: provider,
                      isLiked: provider.isLiked ? false : true);
                },
                height: 35,
                text:
                    provider.isLiked ? S.of(context).liked : S.of(context).like,
                icon: Icon(
                  CupertinoIcons.suit_heart,
                  color:
                      provider.isLiked ? Get.theme.primaryColor : Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CustomeButton(
              ontap: () {
                Get.to(AddReviewScreen());
              },
              height: 35,
              text: S.of(context).rate,
              icon: const Icon(
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

  Widget details(
      {required ProviderInfoController controller,
      required BuildContext context}) {
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
                          text:
                              "${providerController.localizationController.selectedLang.value == 'en' ? provider.locationEnglishName : provider.locationArabicName} | "),
                      TextSpan(
                          style: Get.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          text: providerController.localizationController
                                      .selectedLang.value ==
                                  'en'
                              ? "${providerCalculations.calculateDistance(provider.location.y, provider.location.x).toStringAsFixed(2)} ${S.of(context).Km}  ${S.of(context).away}"
                              : " ${S.of(context).away} ${providerCalculations.calculateDistance(provider.location.y, provider.location.x).toStringAsFixed(2)} ${S.of(context).Km} "),
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
                    text: providerController
                                .localizationController.selectedLang.value ==
                            'en'
                        ? TextSpan(children: <TextSpan>[
                            TextSpan(
                                style: Get.textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                text:
                                    "${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.start))} till ${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.end))} - "),
                            TextSpan(
                                style: Get.textTheme.labelMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                                text:
                                    "${provider.workingHR!.first.day} ${provider.workingHR!.last.day}"),
                          ])
                        : TextSpan(children: <TextSpan>[
                            TextSpan(
                                style: Get.textTheme.labelMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                                text:
                                    "${provider.workingHR!.first.day} ${provider.workingHR!.last.day} - "),
                            TextSpan(
                                style: Get.textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                text:
                                    "${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.start))} till ${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(provider.workingHR!.first.end))} "),
                          ])),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget about(
      {required ProviderInfoController controller,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: lightThemeDividerColor))),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).about,
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            provider.description,
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
                visible: provider.facebook == null || provider.facebook == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  svgPath: "assets/icons/lightheme_icons/facebook_light.svg",
                  onTap: () {
                    providerConteroller.launchUrls(
                        url: provider.facebook!,
                        type: "facebook",
                        inApp: false);
                  },
                ),
              ),
              Visibility(
                visible: provider.instagram == null || provider.instagram == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  onTap: () {
                    providerConteroller.launchUrls(
                        url: provider.instagram!,
                        type: "instagram",
                        inApp: false);
                  },
                  svgPath: "assets/icons/lightheme_icons/instagram_light.svg",
                ),
              ),
              Visibility(
                visible: provider.linkedIn == null || provider.linkedIn == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  onTap: () {
                    providerConteroller.launchUrls(
                        url: provider.linkedIn!,
                        type: "linkedin",
                        inApp: false);
                  },
                  svgPath: "assets/icons/lightheme_icons/linkedin.svg",
                ),
              ),
              Visibility(
                visible: provider.website == null || provider.website == ''
                    ? false
                    : true,
                child: SocialMediaButtom(
                  onTap: () {
                    providerConteroller.launchUrls(
                        url: provider.website!, type: "website", inApp: false);
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

  Widget expansions(
      {required ProviderInfoController providerInfoController,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CustomExpansionTile(
            icon: Icons.settings,
            title: S.of(context).Specialities,
            options: [
              for (var info
                  in providerInfoController.currentProviderInfoModel.speciality)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CirclePoint(),
                    const SizedBox(width: 10),
                    Text(providerConteroller
                                .localizationController.selectedLang.value ==
                            'en'
                        ? info.serviceNameEng
                        : info.serviceNameArb)
                  ],
                )
            ],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: S.of(context).WorkingHours,
            options: [
              for (var info in provider.workingHR!)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  child: Row(
                    children: [
                      const CirclePoint(),
                      const SizedBox(width: 10),
                      AutoSizeText(
                        info.day,
                        style: Get.textTheme.bodyMedium,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      AutoSizeText(
                        '${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(info.start))} - ${DateFormat('hh:mma', 'en').format(DateFormat('HH:mm:ss', 'en').parse(info.end))}',
                        style: Get.textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: S.of(context).Certifications,
            options: [
              for (var info in providerInfoController
                  .currentProviderInfoModel.certification)
                Text(info.certificationName)
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
              providerConteroller.launchUrls(
                  url: provider.phoneNumber, inApp: false, type: "call");
            },
            text: "Click",
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
