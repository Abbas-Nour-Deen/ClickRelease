import 'package:click_release/controllers/localization_controller.dart';
import 'package:click_release/data/analytics_engine.dart';
import 'package:click_release/models/service_model.dart';
import 'package:click_release/screens/selected_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServcieItem extends StatelessWidget {
  final ServiceModel service;
  ServcieItem({super.key, required this.service});

  final LocalizationController localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        localizationController.selectedLang.value == 'en'
            ? service.nameEn
            : service.nameAr,
        style: Get.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
      onTap: () {
        AnalyticsEngine.viewService(service);
        Get.to(SelectedServiceScreen(
          service: service,
        ));
      },
      shape: const Border(
          bottom: BorderSide(
              color: Colors.white,
              width: 0.8)), // Border for the bottom of the ListTile
    );
  }
}
