import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;
  final Color? color;

  const CustomIcon(
      {super.key, required this.icon, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width ?? 20,
      height: height ?? 20,
    );
  }
}
