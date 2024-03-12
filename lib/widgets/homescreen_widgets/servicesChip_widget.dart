import 'package:choice/choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesChipsWidget extends StatelessWidget {
  ServicesChipsWidget({super.key});
  List<String> choices = [
    'Doctor',
    'Home Health Care',
    'Curtains & Carpets',
    'Furniture & Upholstery',
    'Electricity',
    'Plumbing',
    'Solar',
    'Tools Shop',
    'Lawyer',
    'Money Transfer',
    'Photography',
    'Marketing Agency',
    'Graphic Designer',
    'Accessories Shop'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: Get.textTheme.titleLarge,
              ),
              Text(
                "View all",
                style: Get.textTheme.labelMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InlineChoice<String>.single(
              clearable: true,
              value: selectedValue,
              onChanged: (value) {},
              itemCount: choices.length,
              itemBuilder: (state, i) {
                return ChoiceChip(
                  selected: state.selected(choices[i]),
                  onSelected: state.onSelected(choices[i]),
                  label: Text(choices[i]),
                  backgroundColor: Get.theme.colorScheme.onSecondaryContainer,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  padding: const EdgeInsets.all(0),
                  elevation: 0,
                  labelStyle: Get.textTheme.labelMedium,
                );
              },
              listBuilder: ChoiceList.createWrapped(
                spacing: 5,
                runSpacing: 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
              )),
        ],
      ),
    );
  }
}
