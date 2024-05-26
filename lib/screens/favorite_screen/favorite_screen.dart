import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final ProviderController _providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: "Favorites", type: false),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 120,
                        child: ProviderItem(
                          provider: _providerController.selectedProvider,
                          margin: const EdgeInsets.only(bottom: 10),
                        ));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
