// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class LikeProviderWidget extends StatelessWidget {
//   final double? height;
//   final double? width;

//   const LikeProviderWidget({super.key, this.height, this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       child: Stack(
//         children: [
//           Image.asset(
//             "assets/images/me.jpeg",
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: 100,
//           ),
//           Positioned(
//               top: 5,
//               left: 5,
//               child: InkWell(
//                 child: Container(
//                   padding: const EdgeInsets.all(3),
//                   width: 22,
//                   height: 22,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(100)),
//                   child: SvgPicture.asset(
//                     "assets/icons/lightheme_icons/fav.svg",
//                   ),
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
