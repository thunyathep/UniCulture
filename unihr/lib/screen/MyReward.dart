import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class MyReward extends StatefulWidget {
  const MyReward({Key? key}) : super(key: key);

  @override
  State<MyReward> createState() => _MyRewardState();
}

class _MyRewardState extends State<MyReward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Image.asset(
                      'assets/top_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                        'assets/trophy.png',
                      width: MediaQuery.of(context).size.width*0.4,
                      fit: BoxFit.cover,
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
                          child: Text(
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
                    child: Text(
                        'รางวัลของฉัน',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio*8,
                      top: MediaQuery.of(context).devicePixelRatio*50,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: (){},
                            child: Text("ทั้งหมด",
                              style: TextStyle(
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text("รอตรวจสอบ",
                              style: TextStyle(
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text("สำเร็จ",
                              style: TextStyle(
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text("รับของรางวัลแล้ว",
                              style: TextStyle(
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text("ไม่สำเร็จ",
                              style: TextStyle(
                                color: Color(0xff757575),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
