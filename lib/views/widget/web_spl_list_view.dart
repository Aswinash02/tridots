import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/web_spl_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget webSplListView() {
  return SizedBox(
    height: 200,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeController>().webSplList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().webSplList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
            child: webSplContainer(data),
          );
        }),
  );
}

Widget webSplContainer(WebSplModel data) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>()
          .addZeroIndex(img: data.img, title: data.message);
      Get.to(DetailsScreen(
        img: data.img,
        title: data.message,
      ));
    },
    child: SizedBox(
      width: 245,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(data.img)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: data.message,
              maxLines: 2,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    ),
  );
}
