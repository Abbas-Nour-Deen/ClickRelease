import 'package:flutter/material.dart';
import 'package:get/get.dart';

BoxDecoration customContainerDecoration() {
  return BoxDecoration(
      color: Get.theme.colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(5));
}

BoxDecoration customeTileDecoration() {
  return BoxDecoration(
    border: Border(
        bottom: BorderSide(color: Get.theme.colorScheme.primaryContainer)),
  );
}
