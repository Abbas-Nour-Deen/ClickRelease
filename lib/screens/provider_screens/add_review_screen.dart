import 'package:click_release/controllers/provider_controller.dart';
import 'package:click_release/generated/l10n.dart';
import 'package:click_release/theme/app_theme.dart';
import 'package:click_release/widgets/public_widgets/appBar.dart';
import 'package:click_release/widgets/public_widgets/customeButtomSheet.dart';
import 'package:click_release/widgets/public_widgets/custome_btn.dart';
import 'package:click_release/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewScreen extends StatelessWidget {
  AddReviewScreen({super.key});

  final ProviderController providerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet(context),
      appBar: CustomeAppBar(title: S.of(context).LeaveReview),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            stars(context),
            textField(context)
            // text(),
          ],
        ),
      ),
    );
  }

  Widget stars(context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: lightThemeDividerColor))),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              S.of(context).Youroverallrating,
              style: Get.textTheme.titleSmall,
            ),
            const SizedBox(
              height: 15,
            ),
            RatingBarWidget(
              providerController: providerController,
            ),
          ],
        ));
  }

  Widget textField(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Get.theme.colorScheme.onSecondaryContainer),
      child: TextFormField(
        controller: providerController.commentTextController,
        maxLines: null,
        style: Get.textTheme.bodyMedium,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: S.of(context).Enterhere,
            labelStyle: Get.textTheme.labelMedium!
                .copyWith(color: lightTHemeSecondTextColor)),
      ),
    );
  }

  Widget bottomSheet(context) {
    return CustomeButtomSheet(
      childrens: [
        const SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              S.of(context).cancel,
              style: Get.textTheme.labelLarge,
            )),
        const SizedBox(
          width: 50,
        ),
        Expanded(
          child: CustomeButton(
            ontap: () {
              providerController.rateProvider();
            },
            text: S.of(context).save,
          ),
        ),
      ],
    );
  }
}
