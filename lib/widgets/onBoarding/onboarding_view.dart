import 'package:click_release/controllers/onBoarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final OOnBoardingController _onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OOnBoardingController>(
      builder: (controller) => Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _onBoardingController.isFirstPage
                  ? SizedBox.fromSize(
                      size: const Size(47, 10),
                    )
                  : InkWell(
                      child: SvgPicture.asset("assets/icons/backword_btn.svg"),
                      onTap: () => _onBoardingController.goToPreviousPage(),
                    ),

              //Indicator
              SmoothPageIndicator(
                controller: _onBoardingController.pageController,
                count: _onBoardingController.items.items.length,
                onDotClicked: (index) =>
                    _onBoardingController.onDotClicked(index),
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Get.theme.primaryColor,
                ),
              ),

              InkWell(
                child: SvgPicture.asset("assets/icons/forward_btn.svg"),
                onTap: () => _onBoardingController.goToNextPage(),
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => PageView.builder(
              onPageChanged: (index) =>
                  _onBoardingController.onPageChanged(index),
              itemCount: _onBoardingController.items.items.length,
              controller: _onBoardingController.pageController,
              itemBuilder: (context, index) {
                return designedContainer(
                    text1: _onBoardingController.items.items[index].title,
                    text2:
                        _onBoardingController.items.items[index].descriptions,
                    image: _onBoardingController.items.items[index].image,
                    constraints: constraints);
              }),
        ),
      ),
    );
  }

  Widget designedContainer(
      {required String text1,
      required String text2,
      required String image,
      required BoxConstraints constraints}) {
    return Stack(
      children: [
        Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: constraints.maxWidth * 0.1,
          bottom: constraints.maxHeight * 0.2,
          child: SizedBox(
            width: constraints.maxWidth * 0.8,
            child: Column(
              children: [
                Text(text1,
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 23),
                    textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text(text2,
                    style:
                        Get.textTheme.bodySmall!.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
