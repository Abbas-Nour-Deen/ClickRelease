import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeInput extends StatelessWidget {
  final TextEditingController textcontroller;
  final String type;
  final String? hint;
  final String? title;
  final Function(String)? onChanged;

  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  CustomeInput(
      {super.key,
      required this.textcontroller,
      required this.hint,
      required this.type,
      this.onChanged,
      this.title,
      this.color,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin ?? const EdgeInsets.only(top: 4),
          child: Text(title ?? "", style: Get.textTheme.titleSmall!),
        ),
        const SizedBox(
          height: 2,
        ),
        type == "pass"
            ? Obx(() => Container(
                margin: margin ?? const EdgeInsets.only(top: 4),
                padding: padding ?? const EdgeInsets.only(left: 14, right: 10),
                decoration: BoxDecoration(
                  color: (color != null)
                      ? color
                      : (Get.isDarkMode
                          ? Get.theme.primaryColor
                          : Get.theme.colorScheme.primaryContainer),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextField(
                  onChanged: (text) {
                    if (onChanged != null) {
                      onChanged!(text);
                    }
                  },
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  controller: textcontroller,
                  decoration: InputDecoration(
                    hintText: hint ?? "",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                )))
            : Container(
                margin: margin ?? const EdgeInsets.only(top: 8),
                padding: padding ?? const EdgeInsets.only(left: 14, right: 10),
                decoration: BoxDecoration(
                  color: (color != null)
                      ? color
                      : (Get.isDarkMode
                          ? Get.theme.primaryColor
                          : Get.theme.colorScheme.primaryContainer),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextField(
                  onChanged: (text) {
                    if (onChanged != null) {
                      onChanged!(text);
                    }
                  },
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  controller: textcontroller,
                  decoration: InputDecoration(
                      hintText: hint ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none),
                )),
      ],
    );
  }
}
