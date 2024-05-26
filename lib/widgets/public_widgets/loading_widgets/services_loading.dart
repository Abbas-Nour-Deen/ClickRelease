import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServicesLoadingAnimations extends StatelessWidget {
  const ServicesLoadingAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: DynamicHeightGridView(
          itemCount: 14,
          crossAxisCount: 5,
          builder: (context, index) => SizedBox(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.grey[200]),
                      height: 22,
                    )),
              )),
    );
  }
}
