import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesLoadingAnimation extends StatelessWidget {
  const CategoriesLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor:
                Colors.grey[300]!, // Adjust base color for desired effect
            highlightColor:
                Colors.grey[100]!, // Adjust highlight color for desired effect
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 90,
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Colors.grey[200], // Use a neutral color for base
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 30,
                    height: 10,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
