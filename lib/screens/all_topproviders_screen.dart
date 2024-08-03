import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/items/provider_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTopProvidersScreen extends StatelessWidget {
  AllTopProvidersScreen({super.key});

  final ProviderController providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(title: S.of(context).featured),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: providerController.topProviders.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 120,
                child: FadeInRight(
                    animate: true,
                    child: ProviderItem(
                      provider: providerController.topProviders[index],
                      margin: const EdgeInsets.only(bottom: 10),
                    )));
          },
        ),
      ),
    );
  }
}
