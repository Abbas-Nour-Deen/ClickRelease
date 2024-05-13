import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CallButtonWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final double? size;
  const CallButtonWidget({super.key, this.margin, this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: margin ?? const EdgeInsets.only(left: 10, top: 33),
        child: SvgPicture.asset(
          "assets/icons/call_btn.svg",
          height: size ?? null,
        ),
      ),
    );
  }
}
