import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/top_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget topListView() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeController>().topList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().topList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15),
            child: topListViewContainer(data),
          );
        }),
  );
}

Widget topListViewContainer(TopModel data) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.message);
      Get.to(DetailsScreen(img: data.img, title: data.message));
    },
    child: Container(
      width: 280,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.05))),
      child: Row(
        children: [
          Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(data.img), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 12),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: data.type,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                SizedBox(height: 6),
                SizedBox(
                  width: 160,
                  child: CustomText(
                    text: data.message,
                    maxLines: 2,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}