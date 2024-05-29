import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/nav_bar.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/public_widgets/custome_input.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomeButton(
        height: 45,
        text: "Click",
        width: Get.width * 0.8,
        ontap: () => Get.to(CustomNavBar()),
        margin: const EdgeInsets.only(top: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleWidget(),
              inputsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Complete Your Profile",
            style: Get.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget inputsWidget() {
    return Column(
      children: [
        CustomeInput(
          textcontroller: TextEditingController(),
          hint: "Enter your full name",
          type: "text",
          title: "Full Name",
        ),
        const SizedBox(
          height: 15,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            dropdownStyleData: const DropdownStyleData(
                elevation: 2,
                decoration: BoxDecoration(color: lightThemeDividerColor)),
            isExpanded: true,
            value: "Male",
            items: const [
              DropdownMenuItem(
                value: "Male",
                child: Text("Male"),
              ),
              DropdownMenuItem(value: "Female", child: Text("Female"))
            ],
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: lightThemeDividerColor),
              height: 40,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            onChanged: (value) {
              print(value);
            },
          ),
        )
      ],
    );
  }
}
