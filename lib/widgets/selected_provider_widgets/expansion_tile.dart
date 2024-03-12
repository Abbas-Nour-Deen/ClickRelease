import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:click_release/widgets/point.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> options;

  CustomExpansionTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.options,
  }) : super(key: key);

  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: Get.textTheme.labelMedium,
            ),
            minLeadingWidth: 2,
            onTap: () => isExpanded.toggle(),
            trailing: Obx(() => isExpanded.value
                ? Icon(Icons.expand_less)
                : Icon(Icons.expand_more)),
          ),
        ),
        Obx(() {
          if (isExpanded.value) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: options
                    .map(
                      (option) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 2),
                        child: Row(
                          children: [
                            const CirclePoint(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: AutoSizeText(
                                option,
                                style: Get.textTheme.bodyMedium,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        }),
        Divider(), // optional: to separate each CustomExpansionTile
      ],
    );
  }
}
