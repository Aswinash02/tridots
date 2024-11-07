import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/views/details_screen.dart';
import 'package:tridots/views/widget/fashion_list_view.dart';
import 'package:tridots/views/widget/ir_prime_container.dart';
import 'package:tridots/views/widget/latest_news_list_view.dart';
import 'package:tridots/views/widget/leaders_list_view.dart';
import 'package:tridots/views/widget/news_list_view.dart';
import 'package:tridots/views/widget/research_list_vieww.dart';
import 'package:tridots/views/widget/text_row.dart';
import 'package:tridots/views/widget/title_text.dart';
import 'package:tridots/views/widget/top_scroll_view.dart';
import 'package:tridots/views/widget/trending_list_view.dart';
import 'package:tridots/views/widget/web_spl_list_view.dart';

import '../common/custom_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: CustomIcon(icon: 'assets/icons/menu_icon.svg'),
        ),
        title: SizedBox(
            width: 100,
            child: Image.asset('assets/images/tridots_task_logo.png')),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomIcon(icon: 'assets/icons/search_icon.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topListView(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Get.find<HomeController>().addZeroIndex(
                        img: "assets/images/banner_img.jpg",
                        title:
                            "Rahul Gandhi In Manipur: Chopper Ride After Women Protesters Surround Car");
                    Get.to(const DetailsScreen(
                        img: "assets/images/banner_img.jpg",
                        title:
                            "Rahul Gandhi In Manipur: Chopper Ride After Women Protesters Surround Car"));
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/banner_img.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: CustomText(
                  text:
                      "Rahul Gandhi In Manipur: Chopper Ride After Women Protesters Surround Car",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: newsListView(),
              ),
              titleText("Latest News"),
              latestNewsListView(),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomText(
                  text:
                      "Croma opens 58 outlets in 6, Croma retails more than 16,000",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: CustomText(
                  text:
                      "These companies created a lot of hype when they listed on the...",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  color: Colors.grey,
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomText(
                  text: "Select Citywalk opens 4 new stores in June",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: CustomText(
                  text:
                      "These companies created a lot of hype when they listed on the...",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  color: Colors.grey,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 112,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner_img2.png'),
                            fit: BoxFit.fill)),
                  )),
              irPrimeContainer(),
              const SizedBox(height: 10),
              titleText("Web Specials"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
                child: GestureDetector(
                    onTap: () {
                      Get.find<HomeController>().addZeroIndex(
                        img: 'assets/images/web_spl_img.png',
                        title:
                            "Myntra records close to 100% growth in premium ethnicwear",
                      );
                      Get.to(const DetailsScreen(
                        img: 'assets/images/web_spl_img.png',
                        title:
                            "Myntra records close to 100% growth in premium ethnicwear",
                      ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 209,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/web_spl_img.png'),
                              fit: BoxFit.fill)),
                    )),
              ),
              for (int i = 0;
                  i < Get.find<HomeController>().rowText.length;
                  i++)
                textRow(Get.find<HomeController>().rowText[i]),
              webSplListView(),
              titleText("Trending"),
              trendingListView(),
              titleText("Leaders Ink"),
              leadersListView(),
              titleText("Research"),
              researchListView(),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 295,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/ir_vdo_img.png"),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    height: 112,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner_img3.png'),
                            fit: BoxFit.fill)),
                  )),
              titleText("Fashion & Lifestyle"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: fashionListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
