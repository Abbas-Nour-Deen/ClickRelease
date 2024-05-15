// import 'package:click_release/widgets/nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:get/get.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OnBoardingSlider(
//       hasSkip: false,
//       headerBackgroundColor: Colors.green,
//       leading: Text("asdasd"),
//       finishButtonText: 'Click',
//       onFinish: () {
//         Get.to(CustomNavBar());
//       },
//       finishButtonStyle: FinishButtonStyle(
//         backgroundColor: Colors.black,
//       ),
//       centerBackground: true,
//       addButton: false,
//       background: [
//         Image.asset(
//           "assets/images/Onboarding 2.png",
//           alignment: Alignment.topCenter,
//         ),
//         Image.asset("assets/images/Onboarding 3.png"),
//         Image.asset("assets/images/Onboarding 4.png"),
//       ],
//       totalPage: 3,
//       speed: 1.8,
//       pageBodies: [
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 30),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 480,
//               ),
//               Text('Description Text 1'),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 480,
//               ),
//               Text('Description Text 2'),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 480,
//               ),
//               Text('Description Text 2'),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
