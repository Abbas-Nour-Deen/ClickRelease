import 'package:click_release/controllers/login_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NoEnternetPlaceHolder extends StatelessWidget {
  NoEnternetPlaceHolder({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50),
            height: 270,
            child: SvgPicture.asset("assets/checknetwork.svg")),
        Text(
          S.of(context).ops,
          style: Get.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          S.of(context).noenternetconnection,
          style: Get.textTheme.bodySmall!
              .copyWith(color: Colors.grey, fontSize: 11),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomeButton(
            ontap: () {
              loginController.getUserByID();
            },
            height: 40,
            width: double.infinity,
            text: S.of(context).tryagain)
      ],
    );
  }
}
