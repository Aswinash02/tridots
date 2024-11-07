import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/research_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget researchListView() {
  return SizedBox(
    height: 100,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeController>().researchList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().researchList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15),
            child: irPrimeListViewContainer(data),
          );
        }),
  );
}

Widget irPrimeListViewContainer(ResearchModel data) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.message);
      Get.to(DetailsScreen(
        img: data.img,
        title: data.message,
      ));
    },
    child: Container(
      width: 310,
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
                SizedBox(
                  width: 200,
                  child: CustomText(
                    text: data.message,
                    maxLines: 2,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: data.type,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
