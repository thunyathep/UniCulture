import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

import '../../widgets/mission/myMission.dart';
import 'DetailMission.dart';


class MyMission extends StatefulWidget {
  const MyMission({Key? key}) : super(key: key);

  @override
  State<MyMission> createState() => _MyMissionState();
}

class _MyMissionState extends State<MyMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
                        'assets/arrow_target.png',
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
                      top: MediaQuery.of(context).devicePixelRatio*50,
                      left: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ภารกิจของฉัน',
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
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffFCDDDD),
                                    Color(0xffFEA1C3),
                                  ]
                              )
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.calendar_today_rounded,
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
              Column(
                children: [
                  Card_Mission(),
                  Card_Mission(),
                  Card_Mission(),
                  Card_Mission(),
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

}
