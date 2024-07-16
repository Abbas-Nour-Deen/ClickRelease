import 'package:click_release/generated/l10n.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeDropDownWidget<T> extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<T>> items;
  final Function(T) onChanged;
  final T value;
  CustomeDropDownWidget(
      {Key? key,
      required this.title,
      required this.items,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            decoration: customContainerDecoration(),
            child: DropdownButton<T>(
              elevation: 2,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              underline: Container(),
              isExpanded: true,
              dropdownColor: Get.theme.colorScheme.primaryContainer,
              hint: Text(
                S.of(context).select,
                style: Get.textTheme.bodyMedium,
              ),
              value: value,
              items: items,

              //  categories
              //     .map((e) => DropdownMenuItem<String>(
              //           value: e,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 e,
              //                 style: Get.textTheme.bodyMedium,
              //               ),
              //               const Divider(
              //                 color: Colors.white,
              //                 thickness: 1,
              //               )
              //             ],
              //           ),
              //         ))
              //     .toList(),
              onChanged: (value) {
                // Handle dropdown value change here
                onChanged(value as T);
              },
            ),
          )
        ],
      ),
    );
  }
}
