import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceExpansionWidget extends StatelessWidget {
  final String title;
  final Widget content;

  const ServiceExpansionWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(
        title,
        style: Get.textTheme.labelLarge!.copyWith(color: Colors.grey.shade600),
      ),
      children: [content],
    );
  }
}
