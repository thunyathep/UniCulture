import 'package:flutter/material.dart';
import 'package:unihr/BottomNavigate.dart';
import 'package:unihr/screen/Activity/AllActivity.dart';
import 'package:unihr/screen/Activity/MyReward.dart';
import 'package:unihr/screen/Pocket.dart';
import 'package:unihr/screen/SentHeart.dart';
import 'package:unihr/screen/score/Score.dart';
import 'Activity/Allreward.dart';
import 'Activity/MyActivity.dart';
import 'DiaryQuestion.dart';
import 'communicate/Communicate.dart';
import 'feedback/FeedBack.dart';
import 'misson/MyMission.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white
                              .withOpacity(0.0), // Start color with opacity
                          Colors.white.withOpacity(1), // End color with opacity
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: Image.asset(
                            "assets/Unicorn.gif",
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 50,
                      left: MediaQuery.of(context).devicePixelRatio * 5,
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
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          7,
                                      top: MediaQuery.of(context)
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
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          25,
                                      top: MediaQuery.of(context)
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
                                      top: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          3,
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          15,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.022,
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color(0xFFFFC355),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            2,
                                        top: MediaQuery.of(context)
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
                                top: MediaQuery.of(context).devicePixelRatio *
                                    15,
                                left: MediaQuery.of(context).devicePixelRatio *
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
                                    MediaQuery.of(context).devicePixelRatio * 9,
                                vertical:
                                    MediaQuery.of(context).devicePixelRatio *
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
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          17,
                                      top: MediaQuery.of(context)
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
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          25,
                                      top: MediaQuery.of(context)
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
                                      top: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          3,
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          15,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.022,
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Color(0xFFEC6C8B),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            2,
                                        top: MediaQuery.of(context)
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
                                top: MediaQuery.of(context).devicePixelRatio *
                                    24,
                                left: MediaQuery.of(context).devicePixelRatio *
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
                        _buildFeature(context, "รับส่ง\nหัวใจ", SentHeart()),
                        _buildFeature(context, "ฟีดแบค\n", FeedBack()),
                        _buildFeature(context, "แลกของ\nรางวัล", AllReward()),
                        _buildFeature(context, "ภาระกิจ\nของฉัน", MyMission()),
                        _buildFeature(context, "การสื่อสาร\n", Communicate()),
                        _buildFeature(context, "ตาราง\nคะแนน", ScorePage()),
                        _buildFeature(context, "ผลโหวต\n", MyReward()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildFeature(
                            context, "กิจกรรม\nของฉัน\n", MyActivity()),
                        _buildFeature(context, "สมัคร\nกิจกรรม\n", MyReward()),
                        _buildFeature(context, "รางวัล\nของฉัน\n", MyReward()),
                        _buildFeature(context, "คำถาม\nสุขภาพใจ\nรายวัน",
                            DiaryQuestion()),
                        _buildFeature(
                            context, "คำถาม\nสุขภาพใจ\nประจำปี", MyReward()),
                        _buildFeature(
                            context, "ประเมิน\n360 องศา\n", MyReward()),
                        _buildFeature(context, "โค้ชชิ่ง\n\n", MyReward()),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).devicePixelRatio * 5,
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 5,
                              ),
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).devicePixelRatio * 5,
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
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
                  left: MediaQuery.of(context).devicePixelRatio * 8,
                  right: MediaQuery.of(context).devicePixelRatio * 5,
                  top: MediaQuery.of(context).devicePixelRatio * 12,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCardActivity(context, "assets/pikachu.jpg",
                        "บ้านปลา SCG เคมีคอลส์", "open"),
                    _buildCardActivity(context, "assets/pikachu.jpg",
                        "บ้านปลา SCG เคมีคอลส์", "open"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio * 8,
                  right: MediaQuery.of(context).devicePixelRatio * 5,
                  top: MediaQuery.of(context).devicePixelRatio * 5,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCardReward(context),
                    _buildCardReward(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardActivity(
      BuildContext context, image, String title, String status) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).devicePixelRatio * 8,
        vertical: MediaQuery.of(context).devicePixelRatio * 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-1, -1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio * 27,
                  left: MediaQuery.of(context).devicePixelRatio * 18,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio * 20,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio * 2),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    Text(
                      "จังหวัดระยอง",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff757575),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio * 2,
                  left: MediaQuery.of(context).devicePixelRatio * 5,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio * 2),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    Text(
                      "เริ่ม : 1 May 2023 / สิ้นสุด : 1 May 2023",
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio * 2,
                  left: MediaQuery.of(context).devicePixelRatio * 5,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio * 2),
                      child: Icon(
                        Icons.group,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    Text(
                      "สถานะกิจกรรม",
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 2,
                      ),
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: MediaQuery.of(context).size.height * 0.01,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xFF6ED33F),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left:
                                MediaQuery.of(context).devicePixelRatio * 1.5),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio * 1,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 2,
                        left: MediaQuery.of(context).devicePixelRatio * 3,
                      ),
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        children: [
                          Image.asset("assets/coin2.png"),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio * 1,
                              right:
                                  MediaQuery.of(context).devicePixelRatio * 2,
                            ),
                            child: Text(
                              "x3",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Image.asset("assets/Fast_move_coin.png"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    1),
                            child: Text(
                              "x1",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment(-0.8, -0.3),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.1,
              color: Color(0xFF5B4589),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "JUN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardReward(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).devicePixelRatio * 8,
        vertical: MediaQuery.of(context).devicePixelRatio * 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Align(
            alignment: Alignment(-1, -1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.135,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/air_fryer.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      "หม้อทอดไร้น้ำมัน",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      "หมดเขต: 31 Mar 2023",
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      "avaliable: 9",
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio * 1,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 2,
                        left: MediaQuery.of(context).devicePixelRatio * 3,
                      ),
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        children: [
                          Image.asset("assets/coin.png"),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio * 1,
                              right:
                                  MediaQuery.of(context).devicePixelRatio * 2,
                            ),
                            child: Text(
                              "x3",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/heart.png",
                            width: MediaQuery.of(context).size.width * 0.06,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    1),
                            child: Text(
                              "x10",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(BuildContext context, String title, page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 5,
              top: MediaQuery.of(context).devicePixelRatio * 5,
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.17,
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
