import 'package:flutter/material.dart';
import 'package:tridots/common/custom_text.dart';

Widget topContainerWithImage() {
  return Row(
    children: [
      Container(
        height: 60,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/images/top_img1.png'),
          ),
        ),
      ),
      const SizedBox(width: 6),
      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "HOTSPOTS",
              color: Colors.red,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
            CustomText(
              text: "Luxury hotspots: 5 most expensive high streets in the..",
              maxLines: 2,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            )
          ],
        ),
      ),
      const SizedBox(width: 4),
      Container(
        height: 60,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/images/top_img2.png'),
          ),
        ),
      ),
    ],
  );
}
