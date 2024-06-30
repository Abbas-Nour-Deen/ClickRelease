import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/models/gender_model.dart';
import 'package:click_release/screens/profile_screens/profileScreen_widgets/profile_photo.dart';
import 'package:click_release/theme/constant_designs.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/public_widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final LoginController loginController;
  const EditProfileScreen({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(),
      appBar: CustomeAppBar(title: "My Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => loginController.pickAndUploadImage(),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: GetBuilder<LoginController>(
                      initState: (state) =>
                          loginController.savedPickedProfilePhoto != null
                              ? loginController.pickedProfilePhoto =
                                  loginController.savedPickedProfilePhoto
                              : null,
                      id: 'profilePhoto',
                      dispose: (state) =>
                          loginController.pickedProfilePhoto = null,
                      builder: (controller) => ProfilePhoto(
                        type: 'editable',
                        imageUrl: loginController.currentUser.profilePhoto,
                        pickedImage: loginController.pickedProfilePhoto,
                      ),
                    ),
                  ),
                ),
              ),
              CustomeInput(
                textcontroller: loginController.userNameController,
                hint: loginController.currentUser.clientUsername,
                type: "name",
                title: "Name",
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomeInput(
                enabled: false,
                textcontroller: loginController.phoneController,
                hint: loginController.currentUser.clientPhone,
                type: "name",
                title: "Phone Number",
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor:
                                Get.theme.colorScheme.primaryContainer,
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return CustomeButtomSheet(
      childrens: [
        Expanded(
          child: CustomeButton(
            ontap: () {
              loginController.updateUser();
            },
            text: "Click",
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
