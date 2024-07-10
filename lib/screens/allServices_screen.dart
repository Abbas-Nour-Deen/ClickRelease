import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/allServices_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/items/service_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/default_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesScreen extends StatelessWidget {
  final AllServicesController servicesController;
  AllServicesScreen({super.key, required this.servicesController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomeAppBar(title: S.of(context).services),
        body: Column(children: [
          DefaultSearchBar(
            textController: servicesController.serviceSearchController,
            onChanged: (p0) {
              servicesController.searchLogic(p0);
            },
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: GetBuilder<AllServicesController>(
                    dispose: (state) {
                      servicesController.serviceSearchController.clear();
                    },
                    id: 'servicesList',
                    builder: (controller) => ListView.builder(
                          itemCount: servicesController
                                  .serviceSearchController.text.isEmpty
                              ? servicesController.allServices.length
                              : servicesController.filteredServices.length,
                          itemBuilder: (context, index) {
                            return FadeInRight(
                                animate: true,
                                child: ServcieItem(
                                    service:
                                        servicesController.allServices[index]));
                          },
                        ))),
          )
        ]));
  }
}
