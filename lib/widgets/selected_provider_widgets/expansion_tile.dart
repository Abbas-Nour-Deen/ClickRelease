import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String icon;
  final List<Widget> options;

  CustomExpansionTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.options,
  }) : super(key: key);

  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(
        leading: SvgPicture.asset(
          icon,
          height: 19,
        ),
        iconColor: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        initiallyExpanded: false,
        title: Text(
          title,
          style: Get.textTheme.labelLarge!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        children: options,
      ),
    );

    // Column(
    //   children: [
    //     Container(
    // height: 60,
    // padding: const EdgeInsets.all(5),
    // decoration: BoxDecoration(
    //     color: Get.theme.colorScheme.primaryContainer,
    //     borderRadius: BorderRadius.circular(5)),
    //       child: ListTile(
    //         leading: Icon(icon),
    //         title: Text(
    //           title,
    //           style: Get.textTheme.labelMedium,
    //         ),
    //         shape: Border(
    //           bottom:
    //               BorderSide(color: Colors.transparent), // Set to transparent
    //         ),
    //         minLeadingWidth: 2,
    //         onTap: () => isExpanded.toggle(),
    //         trailing: Obx(() => isExpanded.value
    //             ? Icon(Icons.expand_less)
    //             : Icon(Icons.expand_more)),
    //       ),
    //     ),
    //     Obx(() {
    //       if (isExpanded.value) {
    //         return Container(
    //           margin: const EdgeInsets.only(top: 10),
    //           child: Column(
    //             children: options.toList(),
    //           ),
    //         );
    //       } else {
    //         return SizedBox.shrink();
    //       }
    //     }),
    //     Divider(), // optional: to separate each CustomExpansionTile
    //   ],
    // );
  }
}
