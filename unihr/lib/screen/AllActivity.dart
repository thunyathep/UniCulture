import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;


class AllActivity extends StatefulWidget {
  const AllActivity({Key? key}) : super(key: key);

  @override
  State<AllActivity> createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
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
                    child: Image.asset(
                      'assets/top_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
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
                      angle: 5 * math.pi/180,
                      child: Image.asset(
                        'assets/human.png',
                        width: MediaQuery.of(context).size.width*0.45,
                        height: MediaQuery.of(context).size.height*0.23,
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
                      'กิจกรรมทั้งหมด',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  _buildCardActivity(context, "assets/pikachu.jpg", "บ้านปลา SCG เคมีคอลส์","open"),
                  _buildCardActivity(context, "assets/pikachu.jpg", "บ้านปลา SCG เคมีคอลส์","open"),
                  _buildCardActivity(context, "assets/pikachu.jpg", "บ้านปลา SCG เคมีคอลส์","open"),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCardActivity (BuildContext context, image,String title, String status){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).devicePixelRatio*8,
        vertical: MediaQuery.of(context).devicePixelRatio*8,
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
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(-1,-1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width*1,
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
                  top: MediaQuery.of(context).devicePixelRatio*38,
                  left: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*28,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio*2
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height*0.02,
                      ),
                    ),
                    Text(
                      "จังหวัดระยอง",
                      style: TextStyle(
                        fontSize: 14,
                        color:  Color(0xff757575),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*2,
                  left: MediaQuery.of(context).devicePixelRatio*5,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio*2
                      ),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height*0.03,
                      ),
                    ),
                    Text(
                      "เริ่ม : 1 May 2023 / สิ้นสุด : 1 May 2023",
                      style: TextStyle(
                        fontSize: 14,
                        color:  Color(0xff757575),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*2,
                  left: MediaQuery.of(context).devicePixelRatio*5,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right:
                          MediaQuery.of(context).devicePixelRatio*2
                      ),
                      child: Icon(
                        Icons.group,
                        color: Color(0xFF757575),
                        size:
                        MediaQuery.of(context).size.height*0.03,
                      ),
                    ),
                    Text(
                      "สถานะกิจกรรม",
                      style: TextStyle(
                        fontSize: 14,
                        color:  Color(0xff757575),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio*2,
                      ),
                      width: MediaQuery.of(context).size.width*0.12,
                      height: MediaQuery.of(context).size.height*0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xFF6ED33F),
                      ),
                      child: Center(
                        child: Text(
                          status,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*2,
                        left: MediaQuery.of(context).devicePixelRatio*3,
                      ),
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.25,
                      child: Row(
                        children: [
                          Image.asset("assets/coin2.png"),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio*1,
                              right: MediaQuery.of(context).devicePixelRatio*2,
                            ),
                            child: Text("x3",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Image.asset("assets/Fast_move_coin.png"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*1
                            ),
                            child: Text("x1",
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
            alignment: Alignment(-0.85,-0.1),
            child: Container(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width*0.1,
              color: Color(0xFF5B4589),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("1",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("JUN",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
