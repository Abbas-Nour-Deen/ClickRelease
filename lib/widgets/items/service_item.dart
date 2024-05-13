import 'package:click_release/models/service_model.dart';
import 'package:click_release/screens/allCategories_screens/selected_service_screen.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServcieItem extends StatelessWidget {
  final ServiceModel service;
  const ServcieItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        service.nameEn,
        style: Get.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
      onTap: () => Get.to(SelectedServiceScreen(
        service: service,
      )),
      shape: const Border(
          bottom: BorderSide(
              color: lightThemeDividerColor,
              width: 1.0)), // Border for the bottom of the ListTile
    );
  }
}
