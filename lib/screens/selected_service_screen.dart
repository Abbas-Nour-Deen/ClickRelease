import 'package:animate_do/animate_do.dart';
import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/widgets/items/provider_item.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/default_search_bar.dart';
import 'package:click_release/widgets/public_widgets/noenternet_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedServiceScreen extends StatelessWidget {
  final ServiceModel service;
  SelectedServiceScreen({super.key, required this.service});

  final ProviderController _providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
          title:
              _providerController.localizationController.selectedLang.value ==
                      'en'
                  ? service.nameEn
                  : service.nameAr),
      body: GetBuilder<ProviderController>(
        id: 'provList',
        dispose: (state) {
          _providerController.searchProviderByServiceTextController.clear();
          _providerController.tStamp = "0";
          print("asdasdasdasd");
        },
        initState: (state) async => await _providerController
            .getProviderByServiceID(serviceID: service.serviceId),
        builder: (controller) => _providerController.obx(
          (state) => Column(
            children: [
              DefaultSearchBar(
                textController:
                    _providerController.searchProviderByServiceTextController,
                onChanged: (p0) {
                  _providerController.searchLogic(p0);
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: _providerController
                            .searchProviderByServiceTextController.text.isEmpty
                        ? _providerController.currentProviders.length
                        : _providerController.filteredProviders.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 120,
                          child: FadeInRight(
                              animate: true,
                              child: ProviderItem(
                                provider:
                                    _providerController.currentProviders[index],
                                margin: const EdgeInsets.only(bottom: 10),
                              )));
                    },
                  ),
                ),
              ),
            ],
          ),
          onError: (error) => NoEnternetPlaceHolder(
            onretry: () async {
              await _providerController.getProviderByServiceID(
                  serviceID: service.serviceId);
            },
          ),
        ),
      ),
    );
  }
}