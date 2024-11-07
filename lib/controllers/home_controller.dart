import 'package:get/get.dart';
import 'package:tridots/models/details_model.dart';
import 'package:tridots/models/fashion_model.dart';
import 'package:tridots/models/ir_prime_model.dart';
import 'package:tridots/models/latest_news_model.dart';
import 'package:tridots/models/leaders_model.dart';
import 'package:tridots/models/news_model.dart';
import 'package:tridots/models/research_model.dart';
import 'package:tridots/models/top_model.dart';
import 'package:tridots/models/web_spl_model.dart';

class HomeController extends GetxController {
  List<TopModel> topList = [
    const TopModel(
        img: "assets/images/top_img1.png",
        message: 'Luxury hotspots: 5 most expensive high streets in the..',
        type: 'HOTSPOTS'),
    const TopModel(
        img: "assets/images/top_img2.png",
        message: 'Luxury hotspots: 5 most expensive high streets in the..',
        type: 'HOTSPOTS'),
  ];
  List<NewsModel> newsList = [
    const NewsModel(
        img: 'assets/images/news_img1.png',
        title: 'SELECT CITYWALK',
        message: 'Wow! Momo Foods enters Bhopal with Wow!',
        hasTags1: "# Beverage",
        hasTags2: '#reel stories podcast'),
    const NewsModel(
        img: 'assets/images/news_img2.png',
        title: 'FOOD & BEVERAGE',
        message:
            'KFC opens another outlet in Punjab KFC opens another outlet in Punjab',
        hasTags1: "# Beverage",
        hasTags2: '#reel stories podcast'),
    const NewsModel(
        img: 'assets/images/news_img3.png',
        title: 'SELECT CITYWALK',
        message: 'FNP (Ferns N Petals) appoints Ashish Goel',
        hasTags1: "# Citywalk",
        hasTags2: '#reel stories podcast'),
  ];
  List<LatestNewsModel> latestNewsList = [
    const LatestNewsModel(
      img: 'assets/images/latest_news_img.png',
      message: 'Unwrapping the Archies’ reinvention plan',
      hasTags: "#Lifestyle",
    ),
    const LatestNewsModel(
      img: 'assets/images/news_img_1.jpg',
      message:
          'The report highlights the transformative potential of the Open Network for Digital Commerce (ONDC) in redefining and democratizing the e-commerce landscape in India',
      hasTags: "#Lifestyle",
    ),
    const LatestNewsModel(
      img: 'assets/images/news_img_2.jpg',
      message:
          'The report delves into the evolving landscape of retail warehousing in India, offering insights and a forward-looking roadmap for the industry',
      hasTags: "#Lifestyle",
    ),
    const LatestNewsModel(
      img: 'assets/images/news_img_3.jpg',
      message:
          'Deloitte’s ConsumerSignals research said that about half of the participants believe they can effectively handle significant unexpected expenses in the near future',
      hasTags: "#Lifestyle",
    ),
    const LatestNewsModel(
      img: 'assets/images/news_img_4.jpg',
      message:
          'The French company currently operates more than 40 exclusive stores in India out of which 2 are situated in Bengaluru',
      hasTags: "#Lifestyle",
    ),
  ];
  List<IRPrimeModel> irPrimeList = [
    const IRPrimeModel(
      img: 'assets/images/ir_img1.png',
      message:
          '8 retail companies headed by women, These brands are not just famous ...',
    ),
    const IRPrimeModel(
      img: 'assets/images/ir_img2.png',
      message: 'Joom Marketplace offers a global window for sellers...',
    ),
    const IRPrimeModel(
      img: 'assets/images/ir_img3.png',
      message: 'FreshToHome fixing a broken meat market retailing in...',
    ),
  ];
  List<WebSplModel> webSplList = [
    const WebSplModel(
      img: 'assets/images/web_spl_imgs.png',
      message: 'Fashion brand icons: Shailesh Chaturvedi of Arvind Fashions',
    ),
    const WebSplModel(
      img: 'assets/images/web_spl_imgs.png',
      message: 'Fashion brand icons: Shailesh Chaturvedi of Arvind Fashions',
    ),
    const WebSplModel(
      img: 'assets/images/web_spl_imgs.png',
      message: 'Fashion brand icons: Shailesh Chaturvedi of Arvind Fashions',
    ),
  ];

  List<String> rowText = [
    "Cinema industry welcomes lowering GST rates",
    "Patanjali Ayurved to sell 7% stake in Patanjali",
    "Select Citywalk opens 4 new stores in June",
    "Govt imposes import restrictions on certain gold ",
    "Joom Marketplace offers a global window for sellers"
  ];
  List<String> trendingList = [
    "Rahul Gandhi In Manipur",
    "Meta",
    "E-commerce",
    "Fashion",
    "LifeStyle"
  ];

  List<LeaderModel> leadersList = [
    const LeaderModel(
        img: 'assets/images/Leader_img.png',
        message: 'From a total of around 522 Apple stores across the world..',
        profileImg: "assets/images/leader_profile_img1.png",
        title: "Top 5 iconic Apple stores across the world by design",
        author: "Arundhati Roy"),
    const LeaderModel(
        img: 'assets/images/Leader_img.png',
        message: 'From a total of around 522 Apple stores across the world..',
        profileImg: "assets/images/leader_profile_img2.png",
        title: "Top 5 iconic Apple stores across the world by design",
        author: "Vikram Seth"),
  ];
  List<ResearchModel> researchList = [
    const ResearchModel(
        img: 'assets/images/research_image.png',
        message: 'Human touchpoint is extremely important for us,',
        type: "Fashion"),
    const ResearchModel(
        img: 'assets/images/research_image.png',
        message: 'Human touchpoint is extremely important for us,',
        type: "Fashion"),
  ];

  List<FashionModel> fashionList = [
    const FashionModel(
        img: "assets/images/fashion_img1.png",
        message:
            "The singer-songwriter has been spotted in the hybrid garment...",
        hasTags: "#Fashion",
        title: "What makes Fila unique is its attitude and...",
        type1: "Fashion",
        type2: "Food"),
    const FashionModel(
        img: "assets/images/fashion_img2.png",
        message: "The Gucci loafer has been a signature style for 70 years.",
        hasTags: "#Fashion",
        title: "Fashion brand icons: Shailesh Chaturvedi of Arvind Fashions",
        type1: "Shailesh",
        type2: "Fashion"),
    const FashionModel(
        img: "assets/images/fashion_img3.png",
        message: "BTS attended the 2022 Grammy Awards in complementary ...",
        hasTags: "#Fashion",
        title: "Fashion brand icons: Shailesh Chaturvedi of Arvind Fashions",
        type1: "Lifestyle",
        type2: "Fashion")
  ];
  List<FashionModel> mustReadList = [
    const FashionModel(
        img: "assets/images/must_read_img_1.jpg",
        message:
            "The singer-songwriter has been spotted in the hybrid garment...",
        hasTags: "#Fashion",
        title: "Sugar Cosmetics unveils its 200th brand-owned store",
        type1: "Fashion",
        type2: "News"),
    const FashionModel(
        img: "assets/images/must_read_img_2.jpg",
        message: "The Gucci loafer has been a signature style for 70 years.",
        hasTags: "#Fashion",
        title: "Sugar Cosmetics unveils its 200th brand-owned store",
        type1: "Shailesh",
        type2: "Fashion"),
    const FashionModel(
        img: "assets/images/must_read_img_3.jpg",
        message: "BTS attended the 2022 Grammy Awards in complementary ...",
        hasTags: "#Fashion",
        title: "Sugar Cosmetics unveils its 200th brand-owned store",
        type1: "Lifestyle",
        type2: "Fashion")
  ];
  List<DetailsModel> detailsList = [
    const DetailsModel(
        img: 'assets/images/news_img_1.jpg',
        title:
            'The report highlights the transformative potential of the Open Network for Digital Commerce (ONDC) in redefining and democratizing the e-commerce landscape in India',
        message:
            "Bengaluru: ‘Commerce@Bharat: Redefining business models and supply chain’ report by professional services network Deloitte underscores the transformative potential of the Open Network for Digital Commerce (ONDC) in redefining and democratizing the e-commerce landscape in India. \n\n The report sketches out the evolution of digital commerce in India, detailing the challenges faced in the initial stages, including concerns over security, trust, and value perception. The significant impact of major digital commerce platforms in creating effortless user experiences and accelerating the transition to digital payments is emphasized. \n\n The report also provides insights into how ONDC will foster increased discoverability of local businesses, enhancing overall user experience and paving the way for innovations in the digital commerce ecosystem.",
        bottomImg: 'assets/images/bottom_img_1.jpg'),
    const DetailsModel(
        img: 'assets/images/news_img_2.jpg',
        title:
            'The report delves into the evolving landscape of retail warehousing in India, offering insights and a forward-looking roadmap for the industry',
        message:
            "Bengaluru: ‘The Three-mile Tale: Dissecting The New-age Retail Supply Chain Network’ report by real estate consulting firm CBRE delves into the evolving landscape of retail warehousing in India, offering insights and a forward-looking roadmap for the industry. \n\n The report provides detailed insights into the significant trends that are influencing retailers’ warehouse strategies. Additionally, it outlines the logistics delivery chain employed by retailers, which consists of three interconnected stages: the first mile, the middle mile, and the last mile. \n\n Furthermore, the report explores the retail categories that are gearing up for multi-fold growth in the country and also highlights the various technological advancements that empower retail enterprises to execute logistics operations with higher efficiencies, lower costs and greater flexibility based on seasonal demand.",
        bottomImg: 'assets/images/bottom_img_2.jpg'),
    const DetailsModel(
        img: 'assets/images/news_img_3.jpg',
        message:
            "New Delhi: Indian consumer spending is expected to be higher this festive season, on the back of increasing purchases of celebratory items and luxury goods, according to a survey by Deloitte. \n\n Deloitte’s ConsumerSignals research said that about half of the participants believe they can effectively handle significant unexpected expenses in the near future. \n\n “With the festive season nearing, Indian consumer confidence is increasing, with 56 per cent indicating their readiness to spend on celebratory items,” it added. \n\nIn the short term, the survey said, consumer spending is set to rise, particularly in clothing, personal care and recreation, entertainment and leisure. \n\n “These trends point to increased spending as the festive season nears,” it said. \n\n Rajeev Singh, Partner and Consumer Industry Leader at Deloitte Asia Pacific said that healthy growth in India’s economy is encouraging consumers to embrace premium and luxury spending. \n\n “This shift extends across consumer durables, travel, and hospitality, with Tier 2 and 3 markets also showing significant growth. Discretionary spending is poised to increase, benefiting sectors like retail, automotive, and travel and hospitality,” he said. \n\n Further, the survey said that Indian consumers are not only making luxury purchases but are also planning exciting travel adventures, with a surge in domestic and international flight bookings.",
        title:
            'Deloitte’s ConsumerSignals research said that about half of the participants believe they can effectively handle significant unexpected expenses in the near future',
        bottomImg: 'assets/images/bottom_img_3.jpeg'),
    const DetailsModel(
      img: 'assets/images/news_img_4.jpg',
      message:
          'New Delhi: Lacoste, the French clothing brand, opens a new store in Bengaluru, Karnataka, a company official announced in a LinkedIn post on Wednesday. \n\n “Another addition to the Garden City Bengaluru…Mall of Asia now open” said Abhishek Raj, COO of Lacoste India in a LinkedIn post.\n\nThe store is located in the newly opened Phoenix Mall of Asia in Bengaluru, Karnataka. Read more about it here. \n\nThe company currently operates more than 40 exclusive stores in India out of which 5 are situated in Bengaluru, Karnataka. \n\n Even as Lacoste was among the early birds to enter India three decades ago, the French casualwear giant Lacoste has had a measured approach in India and opened only about 40 stores here in three decades. Now, Lacoste aims to be a bit more aggressive with plans to open about 50 standalone stores in the country in the next five years, Marcus Meyer took charge as Chief Executive Officer – Asia Pacific for Lacoste told IndiaRetailing in a September interview. \n\n Founded in 1933 by French Tennis player Rene Lacoste and co-founder Andre Gillier, Lacoste is a French clothing brand which is said to be the first clothing brand in the world to feature its logo on its clothing. \n\n The company today has over 1,000 stores and 15,000 points of sales in 98 countries and its products are also available across 32 online stores in the world.',
      title:
          'The French company currently operates more than 40 exclusive stores in India out of which 2 are situated in Bengaluru',
      bottomImg: 'assets/images/bottom_img_4.jpeg',
    ),
  ];

  void addZeroIndex({required String img, required String title}) {
    detailsList.insert(
        0,
        DetailsModel(
            img: img,
            message:
                'New Delhi: Lacoste, the French clothing brand, opens a new store in Bengaluru, Karnataka, a company official announced in a LinkedIn post on Wednesday. \n\n “Another addition to the Garden City Bengaluru…Mall of Asia now open” said Abhishek Raj, COO of Lacoste India in a LinkedIn post.\n\nThe store is located in the newly opened Phoenix Mall of Asia in Bengaluru, Karnataka. Read more about it here. \n\nThe company currently operates more than 40 exclusive stores in India out of which 5 are situated in Bengaluru, Karnataka. \n\n Even as Lacoste was among the early birds to enter India three decades ago, the French casualwear giant Lacoste has had a measured approach in India and opened only about 40 stores here in three decades. Now, Lacoste aims to be a bit more aggressive with plans to open about 50 standalone stores in the country in the next five years, Marcus Meyer took charge as Chief Executive Officer – Asia Pacific for Lacoste told IndiaRetailing in a September interview. \n\n Founded in 1933 by French Tennis player Rene Lacoste and co-founder Andre Gillier, Lacoste is a French clothing brand which is said to be the first clothing brand in the world to feature its logo on its clothing. \n\n The company today has over 1,000 stores and 15,000 points of sales in 98 countries and its products are also available across 32 online stores in the world.',
            title: title,
            bottomImg: 'assets/images/bottom_img_0.jpg'));
  }

  void removeZeroIndex() {
    detailsList.removeAt(0);
  }
}
