import 'package:click_release/theme/constant_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeDropDownWidget extends StatelessWidget {
  final String title;
  final List<String> categories;
  const CustomeDropDownWidget(
      {Key? key, required this.title, required this.categories})
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
            child: DropdownButton<String>(
              elevation: 2,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              underline: Container(),
              isExpanded: true,
              dropdownColor: Get.theme.colorScheme.primaryContainer,
              hint: Text(
                'Select',
                style: Get.textTheme.bodyMedium,
              ),
              value: null,
              items: categories
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e,
                              style: Get.textTheme.bodyMedium,
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle dropdown value change here
              },
            ),
          )
        ],
      ),
    );
  }
}
