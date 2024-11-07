import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/news_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget newsListView() {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Get.find<HomeController>().newsList.length,
      itemBuilder: (context, index) {
        final data = Get.find<HomeController>().newsList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: newContainer(data),
        );
      });
}

Widget newContainer(NewsModel data) {
  return GestureDetector(
    onTap: (){
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.title);
      Get.to(DetailsScreen(img: data.img, title: data.title));
    },
    child: Row(
      children: [
        Container(
          height: 68,
          width: 106,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(data.img), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: data.title,
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
              const SizedBox(height: 4),
              CustomText(
                text: data.message,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  CustomText(
                    text: data.hasTags1,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: data.hasTags2,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
