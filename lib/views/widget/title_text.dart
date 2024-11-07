import 'package:flutter/material.dart';
import 'package:tridots/common/custom_text.dart';

Widget titleText(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
        child: Container(
          height: 3,
          width: 15,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(2)),
        ),
      ),
    ],
  );
}
