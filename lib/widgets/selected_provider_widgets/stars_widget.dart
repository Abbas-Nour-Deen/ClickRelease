import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class StarsWidget extends StatelessWidget {
  final double rateValue;
  const StarsWidget({super.key, required this.rateValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < rateValue.floor()) {
            // Full star
            return SvgPicture.asset("assets/icons/lightheme_icons/star.svg");
          } else if (index == rateValue.floor() && rateValue % 1 != 0) {
            // Half-filled star
            return SvgPicture.asset(
                "assets/icons/lightheme_icons/half_star.svg");
          } else {
            // Empty star
            return SvgPicture.asset(
                "assets/icons/lightheme_icons/empty_star.svg");
          }
        },
      ),
    );
  }
}
