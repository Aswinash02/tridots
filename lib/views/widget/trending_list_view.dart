import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';

Widget trendingListView() {
  return SizedBox(
    height: 50,
    child: ListView.builder(
        itemCount: Get.find<HomeController>().trendingList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().trendingList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: trendingContainer(data),
          );
        }),
  );
}

Widget trendingContainer(String data) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.withOpacity(0.05))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomText(
          text: data,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
