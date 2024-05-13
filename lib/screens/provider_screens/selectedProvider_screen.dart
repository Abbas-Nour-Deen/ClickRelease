import 'package:auto_size_text/auto_size_text.dart';
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
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(
          title: "",
          trailing: SvgPicture.asset(
              "assets/icons/lightheme_icons/share_btn_light.svg")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              providerInfo(),
              butons(),
              details(),
              about(),
              const ContainedTabWidget(),
              expansions(),
              const SizedBox(
                height: 65,
              ),
            ],
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
              Container(
                // margin: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/me.jpeg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProviderCategoryIcons(),
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
                  "Dr.Abbas Nour Deen",
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
            "Plastic Surgeon",
            style: Get.textTheme.labelSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Physiotherapist",
            style: Get.textTheme.labelSmall!
                .copyWith(color: Get.theme.primaryColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "20 Likes",
                style: Get.textTheme.labelMedium,
              ),
              const SizedBox(
                width: 15,
              ),
              Icon(
                CupertinoIcons.star_fill,
                color: Get.theme.primaryColor,
                size: 12,
              ),
              Text(
                "4.5",
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

  Widget details() {
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
                          text: "Galleri Semaan,Crossroad,| "),
                      TextSpan(
                          style: Get.textTheme.labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          text: "5.55KM away"),
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
                          text: "Mon Sun"),
                    ])),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget about() {
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
            "I am a Master's graduate in Osteopathy & Manual Therapy, with expertise in Physical Therapy.My focus is on delivering tailored home care services to elevate overall wellness.",
            style: Get.textTheme.bodyMedium!
                .copyWith(color: lightTHemeSecondTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SocialMediaButtom(
                svgPath: "assets/icons/lightheme_icons/facebook_light.svg",
              ),
              SocialMediaButtom(
                svgPath: "assets/icons/lightheme_icons/instagram_light.svg",
              ),
              SocialMediaButtom(
                svgPath: "assets/icons/lightheme_icons/enternet_light.svg",
              )
            ],
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }

  Widget expansions() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Specelities",
            options: [
              "Osteopathic Manipulative Treatment (OMT)",
              "Manual Therapy Techniques",
              "Physical Therapy Sessions",
              "Personalized Home Care Plans for Wellness Optimization"
            ],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Specelities",
            options: ["2", "3", "4"],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Specelities",
            options: ["2", "3", "4"],
          ),
          CustomExpansionTile(
            icon: Icons.settings,
            title: "Specelities",
            options: ["2", "3", "4"],
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return CustomeButtomSheet(
      childrens: [
        Expanded(
          child: CustomeButton(
            icon: const Icon(
              CupertinoIcons.phone,
              color: Colors.white,
              size: 22,
            ),
            ontap: () {},
            text: "Click",
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
