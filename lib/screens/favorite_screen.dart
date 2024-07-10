import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/liked_providers_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/custome_drawer.dart';
import 'package:click_release/widgets/navbar_appbar.dart';
import 'package:click_release/widgets/items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        key: _scaffoldKey,
        appBar: AppBarForNavBar(
          scaffoldKey: _scaffoldKey,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetBuilder<LikedProvidersController>(
                builder: (controller) => controller.obx(
                    (state) => ListView.builder(
                          itemCount: controller.likedProviders.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                height: 120,
                                child: FadeInRight(
                                    animate: true,
                                    child: ProviderItem(
                                      provider:
                                          controller.likedProviders[index],
                                      margin: const EdgeInsets.only(bottom: 10),
                                    )));
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
