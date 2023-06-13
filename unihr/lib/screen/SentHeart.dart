import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

import 'Calender.dart';
import 'Search.dart';

class SentHeart extends StatefulWidget {
  const SentHeart({Key? key}) : super(key: key);

  @override
  State<SentHeart> createState() => _SentHeartState();
}

class _SentHeartState extends State<SentHeart> {
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
                        'assets/heartbig.png',
                        width: MediaQuery.of(context).size.width*0.45,
                        height: MediaQuery.of(context).size.height*0.23,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*25,
                      left: MediaQuery.of(context).devicePixelRatio*60,
                    ),
                    child: Transform.rotate(
                      angle: 330 * math.pi/180,
                      child: Image.asset(
                        'assets/heartbig.png',
                        width: MediaQuery.of(context).size.width*0.15,
                        height: MediaQuery.of(context).size.height*0.15,
                        fit: BoxFit.contain,
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
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*40,
                      left: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: const Text(
                      'รับส่งหัวใจ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*55,
                        left: MediaQuery.of(context).devicePixelRatio*12,
                      ),
                      width: MediaQuery.of(context).size.width*0.8,
                      height: MediaQuery.of(context).size.height*0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio*25,
                            ),
                            child: Text(
                              "ส่งหัวใจเลย!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Image.asset(
                              'assets/holdheart.png',
                            width: MediaQuery.of(context).size.width*0.25,
                            height: MediaQuery.of(context).size.height*0.085,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*10,
                            left: MediaQuery.of(context).devicePixelRatio*15
                          ),
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xffFCB0C2),
                                Color(0xffF4BFCF),
                                Color(0xffF0C5F1),
                                Color(0xffE3DEF4),
                                Color(0xffC1E1E7),
                                Color(0xffC1E1E6),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*8,
                                    right: MediaQuery.of(context).devicePixelRatio*2
                                ),
                                child: Transform.rotate(
                                  angle: 180 * math.pi/180,
                                  child: Icon(
                                    Icons.file_upload_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "รับหัวใจ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*10,
                              left: MediaQuery.of(context).devicePixelRatio*5,
                          ),
                          width: MediaQuery.of(context).size.width*0.35,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff757575).withOpacity(0.3),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).devicePixelRatio*8,
                                  right: MediaQuery.of(context).devicePixelRatio*2
                                ),
                                child: Icon(
                                  Icons.file_upload_rounded,
                                  color: Color(0xff757575),
                                ),
                              ),
                              Text(
                                "ส่งหัวใจ",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5,
                            left: MediaQuery.of(context).devicePixelRatio*15,
                          ),
                          child: Row(
                            children: [
                              Text(
                                  "ค้นหาชื่อ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Search(),),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*15,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.55,
                                  height: MediaQuery.of(context).size.height*0.035,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5,
                            left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                          child: Row(
                            children: [
                              Text(
                                "ค้นหาวันที่",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context)=>Calendar())
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*13,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.55,
                                  height: MediaQuery.of(context).size.height*0.035,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Color(0xfff5f5f5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Icon(
                                          Icons.calendar_today_rounded,
                                          size: MediaQuery.of(context).size.width*0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5,
                            left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                          child: Row(
                            children: [
                              Text(
                                "จำนวนหัวใจ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          topLeft: Radius.circular(50),
                                        ),
                                      ),
                                      builder: ((context){
                                        return Container(
                                          height: MediaQuery.of(context).size.height*0.35,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context).devicePixelRatio*10,
                                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                                ),
                                                child: Text(
                                                  "เลือกจำนวนหัวใจ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Color(0xff5B4589),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*5,
                                                    left: MediaQuery.of(context).devicePixelRatio*10,
                                                  ),
                                                  child: Text(
                                                    "ทั้งหมด",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context).devicePixelRatio*10,
                                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "1",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context).devicePixelRatio*10,
                                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "2",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context).devicePixelRatio*10,
                                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "3",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: MediaQuery.of(context).devicePixelRatio*5,
                                                      ),
                                                      child: Image.asset(
                                                        "assets/heart.png",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*10,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.55,
                                  height: MediaQuery.of(context).size.height*0.035,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*10,
                            left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                          child: Text(
                            "รายการการรับหัวใจ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5,
                            left: MediaQuery.of(context).devicePixelRatio*12,
                          ),
                          width: MediaQuery.of(context).size.width*0.8,
                          height: MediaQuery.of(context).size.height*0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ListSentheart(context),
                                ListSentheart(context),
                                ListSentheart(context),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
  Widget ListSentheart (BuildContext){
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.1,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/pikachu.jpg'),
            radius: 30,
          ),
          title: Text('สมปอง นอนดึก'),
          subtitle: Text('32 Jan 3080'),
          trailing: Stack(
            children: [
              Icon(
                  Icons.favorite,
                color: Colors.red,
                size: MediaQuery.of(context).size.width*0.09,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*3,
                  left: MediaQuery.of(context).devicePixelRatio*4,
                ),
                child: Text(
                    "1",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
