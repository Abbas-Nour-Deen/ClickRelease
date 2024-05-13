import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/filterByWidgets/customeDropDown_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterByScreen extends StatelessWidget {
  const FilterByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(title: "Filter By"),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            CustomeDropDownWidget(title: "Categories", categories: [
              "Home Service",
              "Care Service",
              "Technical Services"
            ]),
            CustomeDropDownWidget(title: "Specialities", categories: [
              "Home Service",
              "Care Service",
              "Technical Services"
            ]),
            CustomeDropDownWidget(title: "Location", categories: [
              "Home Service",
              "Care Service",
              "Technical Services"
            ]),
            CustomeDropDownWidget(title: "Rating", categories: [
              "Home Service",
              "Care Service",
              "Technical Services"
            ])
          ],
        ),
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
            ontap: () {},
            text: "Click",
          ),
        ),
      ],
    );
  }
}
