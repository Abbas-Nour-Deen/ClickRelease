import 'package:click_release/controllers/provider_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RatingBarWidget extends StatelessWidget {
  final ProviderController providerController;
  const RatingBarWidget({super.key, required this.providerController});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: 30,
      glow: true,
      glowRadius: 2,
      glowColor: Get.theme.primaryColor,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => SvgPicture.asset(
        "assets/icons/lightheme_icons/star.svg",
      ),
      onRatingUpdate: (rating) {
        providerController.rateOfProvider = rating.toInt();
        print(rating);
      },
    );
  }
}
