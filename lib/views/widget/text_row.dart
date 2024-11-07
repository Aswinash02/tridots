import 'package:flutter/material.dart';
import 'package:tridots/common/custom_text.dart';

Widget textRow(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red, width: 1.5)),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: CustomText(
            text: text,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            maxLines: 2,
          ),
        )
      ],
    ),
  );
}
