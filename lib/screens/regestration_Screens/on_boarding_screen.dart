import 'package:click_release/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Click',
      onFinish: () {
        Get.to(CustomNavBar());
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.black,
      ),
      skipTextButton: Text('Skip'),
      trailing: Text('Login'),
      centerBackground: true,
      background: [
        Image.asset("assets/images/entry.png"),
        Image.asset("assets/images/entry.png"),
        Image.asset("assets/images/entry.png"),
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text('Description Text 1'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text('Description Text 2'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text('Description Text 2'),
            ],
          ),
        )
      ],
    );
  }
}
