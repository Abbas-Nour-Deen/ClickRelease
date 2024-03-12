import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/post.png",
            height: 90,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            "Elderly Fall Prevention Program",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.labelSmall!
                .copyWith(fontSize: 8, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
