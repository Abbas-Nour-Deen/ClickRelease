import 'package:click_release/screens/home_screens/homescreen_widgets/homeScreen_items/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedForYouSlideWidget extends StatelessWidget {
  const RecommendedForYouSlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended for you",
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
                return ProviderItem(
                  margin: const EdgeInsets.only(right: 10),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
