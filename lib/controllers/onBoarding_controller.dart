import 'package:click_release/widgets/nav_bar.dart';
import 'package:click_release/widgets/onBoarding/onboarding_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OOnBoardingController extends GetxController {
  final items = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;
  void goToNextPage() {
    !isLastPage
        ? pageController.nextPage(
            duration: const Duration(milliseconds: 450), curve: Curves.easeIn)
        : Get.to(CustomNavBar());
    update();
  }

  void goToPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 450), curve: Curves.easeIn);
    update();
  }

  void onDotClicked(index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 450), curve: Curves.easeIn);
    update();
  }

  void onPageChanged(index) {
    isLastPage = items.items.length - 1 == index;
    isFirstPage = index == 0;
    print("page changed");
    update();
  }
}
