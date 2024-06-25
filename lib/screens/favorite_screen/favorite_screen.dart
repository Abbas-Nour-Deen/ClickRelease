import 'package:click_release/controllers/liked_providers_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: S.of(context).favorites, type: false),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetBuilder<LikedProvidersController>(
                builder: (controller) => controller.obx(
                    (state) => ListView.builder(
                          itemCount: controller.likedProviders.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                height: 120,
                                child: ProviderItem(
                                  provider: controller.likedProviders[index],
                                  margin: const EdgeInsets.only(bottom: 10),
                                ));
                          },
                        ),
                    onEmpty: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 350,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                            child: SvgPicture.asset(
                              "assets/fav_empty.svg",
                              fit: BoxFit.cover,
                            )),
                        Text(
                          S.of(context).Yourfavoritespageisempty,
                          style: Get.textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          S.of(context).Saveyourpreferredprofessionalshere,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.labelSmall!.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )))));
  }
}
