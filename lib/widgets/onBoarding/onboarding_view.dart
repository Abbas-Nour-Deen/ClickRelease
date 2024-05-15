import 'package:click_release/controllers/onBoarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  bool isLastPage = false;

  final OOnBoardingController _onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OOnBoardingController>(
      builder: (controller) => Scaffold(
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        body: PageView.builder(
            onPageChanged: (index) =>
                _onBoardingController.onPageChanged(index),
            itemCount: _onBoardingController.items.items.length,
            controller: _onBoardingController.pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    _onBoardingController.items.items[index].image,
                    height: Get.height * 0.55,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 15),
                  Text(_onBoardingController.items.items[index].title,
                      style: Get.textTheme.titleLarge,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  Text(_onBoardingController.items.items[index].descriptions,
                      style:
                          Get.textTheme.bodySmall!.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center),
                ],
              );
            }),
      ),
    );
  }

  //Now the problem is when press get started button
  // after re run the app we see again the onboarding screen
  // so lets do one time onboarding

  //Get started button

  // Widget getStarted() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8), color: primaryColor),
  //     width: MediaQuery.of(context).size.width * .9,
  //     height: 55,
  //     child: TextButton(
  //         onPressed: () async {
  //           final pres = await SharedPreferences.getInstance();
  //           pres.setBool("onboarding", true);

  //           //After we press get started button this onboarding value become true
  //           // same key
  //           if (!mounted) return;
  //           Navigator.pushReplacement(
  //               context, MaterialPageRoute(builder: (context) => Home()));
  //         },
  //         child: const Text(
  //           "Get started",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //   );
  // }
}
