import 'package:flutter/material.dart';
import 'package:unihr/feature/unicalture/presentation/pages/bottomnav/BottomNavigate.dart';
import 'package:unihr/feature/unicalture/presentation/pages/poll/Poll.dart';
import 'package:unihr/feature/unicalture/presentation/pages/question/EvaluateThreeSixty.dart';
import 'package:unihr/feature/unicalture/presentation/pages/question/YearQuestion.dart';
import 'package:unihr/feature/unicalture/presentation/pages/score/Score.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unihr/feature/unicalture/presentation/widgets/homepage/cardActivity.dart';
import 'package:unihr/feature/unicalture/presentation/widgets/homepage/cardReward.dart';
import '../activity/AllActivity.dart';
import '../activity/Allreward.dart';
import '../activity/MyActivity.dart';
import '../activity/MyReward.dart';
import '../question/DiaryQuestion.dart';
import '../pocket/Pocket.dart';
import '../heartfeature/SentHeart.dart';
import '../communicate/Communicate.dart';
import '../feedback/feedBack.dart';
import '../misson/MyMission.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/top_bar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white
                                  .withOpacity(0.0),
                              // Start color with opacity
                              Colors.white.withOpacity(1),
                              // End color with opacity
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .devicePixelRatio * 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Image.asset(
                                "assets/Unicorn.gif",
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.6,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery
                              .of(context)
                              .devicePixelRatio * 40,
                          left: MediaQuery
                              .of(context)
                              .devicePixelRatio * 5,
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFFDD87),
                                        Color(0xFFFFF5E2),
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.13,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              7,
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              2,
                                        ),
                                        child: const Text(
                                          "เหรียญทองที่ได้รับ",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              25,
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              2,
                                        ),
                                        child: const Text(
                                          "25",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              3,
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              15,
                                        ),
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height *
                                            0.022,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                          color: Color(0xFFFFC355),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                0.5,
                                          ),
                                          child: Text(
                                            "แลกของรางวัล",
                                            style: TextStyle(
                                              fontSize: 12,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery
                                        .of(context)
                                        .devicePixelRatio *
                                        15,
                                    left: MediaQuery
                                        .of(context)
                                        .devicePixelRatio *
                                        30,
                                  ),
                                  child: Image.asset("assets/gold.png"),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio * 9,
                                    vertical:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio *
                                        10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFEC6C8B),
                                        Color(0xFFFFF8FA),
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.13,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              17,
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              2,
                                        ),
                                        child: const Text(
                                          "หัวใจที่ได้รับ",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              25,
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              2,
                                        ),
                                        child: const Text(
                                          "10",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              3,
                                          right: MediaQuery
                                              .of(context)
                                              .devicePixelRatio *
                                              15,
                                        ),
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height *
                                            0.022,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                          color: Color(0xFFEC6C8B),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                0.5,
                                          ),
                                          child: Text(
                                            "ส่งหัวใจ(9/10)",
                                            style: TextStyle(
                                              fontSize: 12,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery
                                        .of(context)
                                        .devicePixelRatio *
                                        24,
                                    left: MediaQuery
                                        .of(context)
                                        .devicePixelRatio *
                                        38,
                                  ),
                                  child: Image.asset("assets/holdheart.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildFeature(context, "กระเป๋า\nเหรียญ", Pocket()),
                            _buildFeature(
                                context, "รับส่ง\nหัวใจ", SentHeart()),
                            _buildFeature(context, "ฟีดแบค\n", FeedBack()),
                            _buildFeature(
                                context, "แลกของ\nรางวัล", AllReward()),
                            _buildFeature(
                                context, "ภาระกิจ\nของฉัน", MyMission()),
                            _buildFeature(
                                context, "การสื่อสาร\n", Communicate()),
                            _buildFeature(context, "ตาราง\nคะแนน", ScorePage()),
                            _buildFeature(context, "ผลโหวต\n", PollPage()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildFeature(
                                context, "กิจกรรม\nของฉัน\n", MyActivity()),
                            _buildFeature(
                                context, "สมัคร\nกิจกรรม\n", MyReward()),
                            _buildFeature(
                                context, "รางวัล\nของฉัน\n", MyReward()),
                            _buildFeature(context, "คำถาม\nสุขภาพใจ\nรายวัน",
                                DiaryQuestion()),
                            _buildFeature(
                                context, "คำถาม\nสุขภาพใจ\nประจำปี",
                                YearQuestion()),
                            _buildFeature(
                                context, "ประเมิน\n360 องศา\n", Evaluate()),
                            _buildFeature(context, "โค้ชชิ่ง\n\n", MyReward()),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio * 5,
                                    top:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio * 5,
                                  ),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.08,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.17,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio * 5,
                                    top:
                                    MediaQuery
                                        .of(context)
                                        .devicePixelRatio * 2,
                                  ),
                                  child: Text(
                                    "\n\n\n",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery
                          .of(context)
                          .devicePixelRatio * 8,
                      right: MediaQuery
                          .of(context)
                          .devicePixelRatio * 5,
                      top: MediaQuery
                          .of(context)
                          .devicePixelRatio * 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "กิจกรรมที่น่าสนใจ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AllActivity()),
                            );
                          },
                          child: Text(
                            "ดูทั้งหมด",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomepageActivity(
                            image: 'assets/pikachu.jpg',
                            title: "บ้านปลา SCG เคมีคอลส์",
                            status: 'open',
                        ),
                        HomepageActivity(
                          image: 'assets/pikachu.jpg',
                          title: "บ้านปลา SCG เคมีคอลส์",
                          status: 'open',
                        ),
                        HomepageActivity(
                          image: 'assets/pikachu.jpg',
                          title: "บ้านปลา SCG เคมีคอลส์",
                          status: 'open',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery
                          .of(context)
                          .devicePixelRatio * 8,
                      right: MediaQuery
                          .of(context)
                          .devicePixelRatio * 5,
                      top: MediaQuery
                          .of(context)
                          .devicePixelRatio * 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "รางวัลที่น่าสนใจ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "ดูทั้งหมด",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomepageReward(
                            title: "หม้อทอดไร้น้ำมัน",
                            image: "assets/air_fryer.png",
                            quantity: 9),
                        HomepageReward(
                            title: "หม้อทอดไร้น้ำมัน",
                            image: "assets/air_fryer.png",
                            quantity: 9),
                        HomepageReward(
                            title: "อะไรก็ได้",
                            image: "assets/pikachu.jpg",
                            quantity: 9),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildFeature(BuildContext context, String title, page) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 5,
              top: MediaQuery.of(context).devicePixelRatio * 3,
            ),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFCDDDD),
                    Color(0xffFEA1C3),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 5,
              top: MediaQuery.of(context).devicePixelRatio * 2,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}