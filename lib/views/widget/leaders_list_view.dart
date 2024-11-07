import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/leaders_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget leadersListView() {
  return SizedBox(
    height: 340,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeController>().leadersList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().leadersList[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
            child: leaderListViewContainer(data),
          );
        }),
  );
}

Widget leaderListViewContainer(LeaderModel data) {
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
    child: SizedBox(
      width: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 188,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data.img), fit: BoxFit.fill),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image(image: AssetImage(data.profileImg)),
              SizedBox(width: 10),
              Expanded(
                child: CustomText(
                  text: data.title,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: data.message,
              maxLines: 2,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: data.author,
              maxLines: 2,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
