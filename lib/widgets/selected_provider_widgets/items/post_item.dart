import 'package:auto_size_text/auto_size_text.dart';
import 'package:click_release/widgets/point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image(),
          const SizedBox(
            width: 5,
          ),
          content()
        ],
      ),
    );
  }

  Widget image() {
    return SizedBox(
      width: 100,
      child: Image.asset(
        "assets/images/post.png",
      ),
    );
  }

  Widget categoryServiceLabel() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Text(
            "Health",
            style: Get.textTheme.labelSmall,
          ),
          CirclePoint(),
          Text(
            "Physiotherapist",
            style: Get.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget description() {
    return AutoSizeText(
      "Welcome 2024 with a fresh start! Enjoy 20% off 30-minute massages and kickstart your year feeling rejuvenated. Book now!",
      style: Get.textTheme.bodySmall,
      maxLines: 5,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget footer() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/me.jpeg",
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Text("Dr.Abbas Nour Deen",
              style: Get.textTheme.labelSmall!
                  .copyWith(fontWeight: FontWeight.w700)),
          const CirclePoint(),
          Text("2 hours ago",
              style: Get.textTheme.labelSmall!
                  .copyWith(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryServiceLabel(),
          const SizedBox(
            height: 4,
          ),
          description(),
          const SizedBox(
            height: 5,
          ),
          footer()
        ],
      ),
    );
  }
}
