import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/nearme_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearMeWidget extends StatelessWidget {
  const NearMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Near me",
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return NearMeItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
