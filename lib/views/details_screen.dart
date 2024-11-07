import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tridots/common/custom_icon.dart';
import 'package:tridots/common/custom_text.dart';
import 'package:tridots/controllers/home_controller.dart';
import 'package:tridots/views/widget/must_read_list_view.dart';
import 'package:tridots/views/widget/title_text.dart';

class DetailsScreen extends StatefulWidget {
  final String img;
  final String title;

  const DetailsScreen({super.key, required this.img, required this.title});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late ScrollController scrollController;
  final PageController pageController = PageController();
  int currentPage = 0;

  bool isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    pageController.addListener(() {
      int newPage = pageController.page!.round();
      if (newPage != currentPage) {
        setState(() {
          isAppBarVisible = true;
          currentPage = newPage;
        });
      }
    });
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isAppBarVisible) setState(() => isAppBarVisible = false);
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!isAppBarVisible) setState(() => isAppBarVisible = true);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.find<HomeController>().removeZeroIndex();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  Get.find<HomeController>().detailsList.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            AnimatedOpacity(
              opacity: isAppBarVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: isAppBarVisible
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.find<HomeController>().removeZeroIndex();
                              Get.back();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              color: Colors.white,
                              padding: const EdgeInsets.all(6),
                              child: const CustomIcon(
                                icon: 'assets/icons/arrow_back_icon.svg',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Image.asset(
                                'assets/images/tridots_task_logo.png'),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: CustomIcon(
                                icon: 'assets/icons/search_icon.svg'),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(height: 0),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: Get.find<HomeController>().detailsList.length,
                itemBuilder: (context, index) {
                  final data = Get.find<HomeController>().detailsList[index];
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !isAppBarVisible
                            ? const SizedBox(
                                height: 50,
                              )
                            : const SizedBox(),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                              width: double.infinity,
                              height: 112,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/banner_img2.png'),
                                      fit: BoxFit.fill)),
                            )),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6),
                          child: Row(
                            children: [
                              CustomText(
                                text: "Big Grid",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomIcon(
                                  icon: 'assets/icons/views_icon.svg',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              CustomText(
                                text: "419 views",
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomIcon(
                                  icon: 'assets/icons/share_icon.svg',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              CustomText(
                                text: "427 shares",
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomIcon(
                                  icon: 'assets/icons/timer_icon.svg',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              CustomText(
                                text: "2 minute read",
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomText(
                            // text: widget.title,
                            text: data.message,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            maxLines: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6),
                          child: Row(
                            children: [
                              Image(
                                  image: AssetImage(
                                      "assets/images/leader_profile_img1.png")),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Barkha Dutt",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: CustomText(
                                          text: "2 days ago",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      CustomIcon(
                                        icon: "assets/icons/share_icon.svg",
                                        height: 10,
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: CustomIcon(
                                          icon:
                                              "assets/icons/three_dot_icon.svg",
                                          height: 10,
                                          width: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 210,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(data.img),
                                    // image: AssetImage(widget.img),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                              maxLines: 100,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              text: data.message),
                        ),
                        titleText("Must Read"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: mustReadListView(context),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                              maxLines: 10,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              text:
                                  "Ingka Centres is the commercial real estate arm of Ingka Group, the Swedish giant that runs Ikea furniture chain globally and it will be the newest entrant in the Indian shopping centre industry. Anticipated to surge at an annual growth rate of 29%, the retail sales within the shopping malls of the top eight cities are poised to reach an impressive 39 billion by 2027."),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                              maxLines: 10,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              text:
                                  "Earlier this year, Ingka Centres announced that PVR Ltd. became its first tenant for the mall, which the company terms as a ‘meeting place’. PVR will operate a nine-screen movie multiplex at Lykli."),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 280,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(data.bottomImg),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                              maxLines: 10,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              text:
                                  "Ikea’s sister concern, Ingka Centres, is planning to build a slew of malls in India to tap the growing market for modern retailing in India amid an explosion of global brands heading to India in recent years."),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                            text: "Comments",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                  image: AssetImage(
                                      'assets/images/samantha_profile_img.png')),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      CustomText(
                                        text: "samantha",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                      ),
                                      SizedBox(width: 6),
                                      CustomText(
                                        text: "2 hours ago",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  const SizedBox(
                                    width: 280,
                                    child: CustomText(
                                      text:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      maxLines: 2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  const Row(
                                    children: [
                                      CustomIcon(
                                        icon: "assets/icons/thumbsup_icon.svg",
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(width: 8),
                                      CustomIcon(
                                        icon:
                                            "assets/icons/thumbsdown_icon.svg",
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(width: 8),
                                      CustomText(
                                        text: "Share  Reply",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 170,
                                      ),
                                      CustomIcon(
                                        icon: "assets/icons/three_dot_icon.svg",
                                        height: 10,
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Row(
                                          children: [
                                            CustomText(
                                              text: "Read All Commends",
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_up,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.005)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const CustomText(
                                          text: "Post a Commend",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
