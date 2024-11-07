import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/fashion_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget fashionListView() {
  return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Get.find<HomeController>().fashionList.length,
      itemBuilder: (context, index) {
        final data = Get.find<HomeController>().fashionList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: fashionContainer(data),
        );
      });
}

Widget fashionContainer(FashionModel data) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.title);
      Get.to(DetailsScreen(
        img: data.img,
        title: data.title,
      ));
    },
    child: Row(
      children: [
        Container(
          height: 125,
          width: 145,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image:
                DecorationImage(image: AssetImage(data.img), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: data.type1,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Container(
                      width: 1,
                      height: 10,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: data.type2,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                text: data.title,
                fontWeight: FontWeight.w500,
                maxLines: 2,
                fontSize: 14,
              ),
              const SizedBox(height: 4),
              CustomText(
                text: data.message,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Colors.grey,
              ),
              const SizedBox(height: 6),
              CustomText(
                text: data.hasTags,
                fontWeight: FontWeight.w400,
                fontSize: 11,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
