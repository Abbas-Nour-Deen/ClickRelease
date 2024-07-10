import 'package:animate_do/animate_do.dart';
import 'package:auto_scroll/auto_scroll.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/items/provider_item.dart';
import 'package:click_release/widgets/public_widgets/loading_widgets/topProviders_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedForYouSlideWidget extends StatelessWidget {
  RecommendedForYouSlideWidget({super.key});

  final ProviderController _providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).featured,
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ProviderController>(
            id: 'topProviders',
            initState: (state) => _providerController.isFirstLoading
                ? _providerController.getTopProviders()
                : null,
            builder: (controller) => _providerController.isTopProvidersLoading
                ? const TopProvidersLoading()
                : Expanded(
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _providerController.topProviders.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                          animate: true,
                          child: ProviderItem(
                            provider: _providerController.topProviders[index],
                            margin: const EdgeInsets.only(right: 10),
                          ));
                    },
                  )),
          )
        ],
      ),
    );
  }
}
