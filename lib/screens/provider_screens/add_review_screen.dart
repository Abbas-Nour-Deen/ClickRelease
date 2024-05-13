import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(title: "Leave Review"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            stars(),
            textField()
            // text(),
          ],
        ),
      ),
    );
  }

  Widget stars() {
    return Container(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: lightThemeDividerColor))),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Your overall rating",
              style: Get.textTheme.titleSmall,
            ),
            const SizedBox(
              height: 15,
            ),
            RatingBarWidget(),
          ],
        ));
  }

  Widget textField() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Get.theme.colorScheme.onSecondaryContainer),
      child: TextFormField(
        maxLines: null,
        style: Get.textTheme.bodyMedium,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Enter here",
            labelStyle: Get.textTheme.labelMedium!
                .copyWith(color: lightTHemeSecondTextColor)),
      ),
    );
  }

  Widget bottomSheet() {
    return CustomeButtomSheet(
      childrens: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "Cancel",
              style: Get.textTheme.labelLarge,
            )),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: CustomeButton(
            ontap: () {
              Get.to(AddReviewScreen());
            },
            text: "Click",
          ),
        ),
      ],
    );
  }
}
