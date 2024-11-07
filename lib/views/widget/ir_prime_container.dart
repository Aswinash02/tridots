import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/models/ir_prime_model.dart';
import 'package:tridots/views/details_screen.dart';

Widget irPrimeContainer() {
  return Container(
    height: 340,
    padding: const EdgeInsets.all(15.0),
    color: Colors.red.withOpacity(0.05),
    child: Column(
      children: [
        const Row(
          children: [
            Image(image: AssetImage('assets/icons/ir_icon.png')),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "IR Prime",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Top 3  stories of the day",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "view all",
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(),
        irPrimeListView(),
      ],
    ),
  );
}

Widget irPrimeListView() {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Get.find<HomeController>().irPrimeList.length,
        itemBuilder: (context, index) {
          final data = Get.find<HomeController>().irPrimeList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: irPrimeListViewContainer(data),
          );
        }),
  );
}

Widget irPrimeListViewContainer(IRPrimeModel data) {
  return GestureDetector(
    onTap: () {
      Get.find<HomeController>().addZeroIndex(
          img: data.img,
          title:
          data.message);
      Get.to(DetailsScreen(img: data.img, title: data.message));
    },
    child: Row(
      children: [
        Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image:
                DecorationImage(image: AssetImage(data.img), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomText(
            text: data.message,
            maxLines: 2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
