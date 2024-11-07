import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/fashion_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget mustReadListView(BuildContext cxt) {
  return Container(
    height: 120,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeController>().mustReadList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().mustReadList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
            child: mustReadContainer(data, cxt),
          );
        }),
  );
}

Widget mustReadContainer(FashionModel data, BuildContext cxt) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.title);
      Navigator.push(
          cxt,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    img: data.img,
                    title: data.title,
                  )));
    },
    child: Container(
      height: 300,
      width: 290,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.05),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(data.img), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  text: data.hasTags,
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
