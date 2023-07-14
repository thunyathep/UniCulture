import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

import 'AllScore.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*1,
                    child: Image.asset(
                      'assets/top_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0), // Start color with opacity
                          Colors.white.withOpacity(1), // End color with opacity
                        ],
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.rotate(
                      angle: 2 * math.pi/180,
                      child: Image.asset(
                        'assets/coin_score.png',
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.27,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*20
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height*0.04,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.height*0.035,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/coin2.png',
                                    width: MediaQuery.of(context).size.width*0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*3,
                                    ),
                                    child: Text(
                                      '26',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/heart.png',
                                    width: MediaQuery.of(context).size.width*0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*3,
                                    ),
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*17,
                        left: MediaQuery.of(context).devicePixelRatio*17
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.18,
                          height: MediaQuery.of(context).size.height*0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffFCB0C2),
                                    Color(0xffF4BFCF),
                                    Color(0xffF0C5F1),
                                    Color(0xffE3DEF4),
                                    Color(0xffC1E1E7),
                                    Color(0xffC1E1E6),
                                  ]
                              ),
                              width: 4,
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.18,
                            height: MediaQuery.of(context).size.height*0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/Unicorn.gif',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio*5,
                          ),
                          child: const Text(
                            'สมพงศ์ จำปี',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*50,
                      left: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ตารางคะแนน',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio*2,
                            right: MediaQuery.of(context).devicePixelRatio*5,
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff5B4589), //<-- SEE HERE
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                              width: 2.0,
                              color: const Color(0xffD9D9D9),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.07,
                                child: Image.asset(
                                  "assets/heart.png",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*3,
                              ),
                              child: Text(
                                "หัวใจ",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                            width: 2.0,
                            color: const Color(0xffD9D9D9),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.07,
                                child: Image.asset(
                                  "assets/coin2.png",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*3,
                              ),
                              child: Text(
                                "เหรียญ",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*10,
                  left: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  "Top 10",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.85,
                  height: MediaQuery.of(context).size.height*0.3,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.283,
                            height: MediaQuery.of(context).size.height*0.25,
                            color: Color(0xffFCB0C2),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.283,
                              height: MediaQuery.of(context).size.height*0.3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.7), // Start color with opacity
                                    Colors.white.withOpacity(1), // End color with opacity
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).devicePixelRatio*5,
                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: MediaQuery.of(context).size.height*0.1,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/pikachu.jpg'),
                                            radius: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Align(
                                          alignment: Alignment(0.7,1),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/heart.png",
                                                width: MediaQuery.of(context).size.width*0.08,
                                                height: MediaQuery.of(context).size.height*0.16,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context).devicePixelRatio*2.5,
                                                  top: MediaQuery.of(context).devicePixelRatio*17,
                                                ),
                                                child: Text(
                                                  "30",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*37,
                                          left: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Text(
                                          "นายสัญจร นอนดึก",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*42,
                                          left: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Text(
                                          "Logistc",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.283,
                            height: MediaQuery.of(context).size.height*0.25,
                            color: Color(0xffFCB0C2),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.283,
                              height: MediaQuery.of(context).size.height*0.3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.2), // Start color with opacity
                                    Colors.white.withOpacity(1), // End color with opacity
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).devicePixelRatio*5,
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: MediaQuery.of(context).size.height*0.1,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/pikachu.jpg'),
                                            radius: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*1,
                                        ),
                                        child: Align(
                                          alignment: Alignment(0.7,1),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/heart.png",
                                                width: MediaQuery.of(context).size.width*0.08,
                                                height: MediaQuery.of(context).size.height*0.16,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context).devicePixelRatio*2.5,
                                                  top: MediaQuery.of(context).devicePixelRatio*17,
                                                ),
                                                child: Text(
                                                  "30",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*27,
                                          left: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Text(
                                          "นายสัญจร นอนดึก",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*32,
                                          left: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Text(
                                          "Logistc",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.283,
                            height: MediaQuery.of(context).size.height*0.25,
                            color: Color(0xffFCB0C2),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.283,
                              height: MediaQuery.of(context).size.height*0.3,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white.withOpacity(0.7), // Start color with opacity
                                    Colors.white.withOpacity(1), // End color with opacity
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).devicePixelRatio*5,
                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: MediaQuery.of(context).size.height*0.1,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/pikachu.jpg'),
                                            radius: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Align(
                                          alignment: Alignment(0.7,1),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/heart.png",
                                                width: MediaQuery.of(context).size.width*0.08,
                                                height: MediaQuery.of(context).size.height*0.16,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context).devicePixelRatio*2.5,
                                                  top: MediaQuery.of(context).devicePixelRatio*17,
                                                ),
                                                child: Text(
                                                  "30",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*37,
                                          left: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Text(
                                          "นายสัญจร นอนดึก",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*42,
                                          left: MediaQuery.of(context).devicePixelRatio*10,
                                        ),
                                        child: Text(
                                          "Logistc",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.1,
                          ),
                          Container(
                            // margin: EdgeInsets.only(
                            //   top: MediaQuery.of(context).devicePixelRatio*40,
                            // ),
                            width: MediaQuery.of(context).size.width*0.85,
                            child: Image.asset(
                              "assets/podium.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ListView.builder(
              //   itemCount: 10,
              //   itemBuilder: (BuildContext context, int index) {
              //     return CardScore(context, index + 1);
              //   },
              // ),

              CardScore(context, 4),
              CardScore(context, 5),
              CardScore(context, 6),
              CardScore(context, 7),
              CardScore(context, 8),
              CardScore(context, 9),
              CardScore(context, 10),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AllScore())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    width: MediaQuery.of(context).size.width*0.85,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff757575).withOpacity(0.25),
                    ),
                    child: Center(
                      child: Text(
                        "ดูทั้งหมด",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardScore extends StatelessWidget {
  final BuildContext context;
  final int number;

  const CardScore(this.context, this.number);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).devicePixelRatio * 5,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(
                        color: Color(0xff8C76BB),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )),
                    child: Center(
                      child: Text(
                        "$number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/pikachu.jpg'),
                      radius: 28,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 3,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ปิกาจู ตัวจิ๋ว",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "ลูกน้องซาโตชิ",
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 5,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/heart.png",
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio * 3,
                            left: MediaQuery.of(context).devicePixelRatio * 3.5,
                          ),
                          child: Text(
                            "23",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
