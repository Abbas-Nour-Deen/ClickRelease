import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/models/gender_model.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/public_widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomeButton(
        height: 45,
        text: "Click",
        width: Get.width * 0.92,
        ontap: () => loginController.createNewUser(),
        margin: const EdgeInsets.only(top: 30),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageWidget(),
                inputsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Column(
      children: [
        Text(
          "Complete Your Profile",
          style: Get.textTheme.titleLarge!.copyWith(fontSize: 26),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          "assets/images/createProfile_holder.png",
          height: 240,
        ),
      ],
    );
  }

  Widget inputsWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeInput(
            textcontroller: loginController.firstNameController,
            hint: "Enter your first name",
            type: "text",
            title: "First name",
          ),
          CustomeInput(
            textcontroller: loginController.lastNameController,
            hint: "Enter your last name",
            type: "text",
            title: "Last name",
          ),
          CustomeInput(
            textcontroller: loginController.userNameController,
            hint: "Enter your user name",
            type: "text",
            title: "User Name",
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Gender",
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: customContainerDecoration(),
            child: GetBuilder<LoginController>(
              id: 'genderDropDown',
              builder: (controller) => DropdownButtonHideUnderline(
                child: DropdownButton<GenderModel>(
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  underline: Container(),
                  isExpanded: true,
                  dropdownColor: Get.theme.colorScheme.primaryContainer,
                  value: loginController.selectedGender,
                  hint: Text(
                    "Select",
                    style: Get.textTheme.bodyMedium,
                  ),
                  items: loginController.genders
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.type,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    loginController.selectedGender = value;
                    loginController.update(["genderDropDown"]);
                    print(value!.type);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
