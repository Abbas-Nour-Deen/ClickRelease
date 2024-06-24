import 'package:click_release/controllers/liked_providers_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: S.of(context).favorites, type: false),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GetBuilder<LikedProvidersController>(
                  builder: (controller) => controller.obx((state) => Expanded(
                        child: ListView.builder(
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
                      )))
            ],
          ),
        ));
  }
}
