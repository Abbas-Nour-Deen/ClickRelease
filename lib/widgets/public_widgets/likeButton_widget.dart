import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/models/provider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LikeButtunWidget extends StatelessWidget {
  final ProviderModel provider;
  LikeButtunWidget({super.key, required this.provider});

  final ProviderController providerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 1,
        child: InkWell(
          onTap: () async {
            await providerController.likeProvider(
                provider: provider, isLiked: !provider.isLiked);
          },
          child: GetBuilder<ProviderController>(
            id: 'likebtn',
            builder: (controller) => Container(
              padding: const EdgeInsets.all(3),
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: SvgPicture.asset(
                provider.isLiked
                    ? "assets/icons/lightheme_icons/fav_filled.svg"
                    : "assets/icons/lightheme_icons/fav.svg",
              ),
            ),
          ),
        ));
  }
}
