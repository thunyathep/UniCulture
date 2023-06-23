import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

class DetailPopUp extends StatefulWidget {
  const DetailPopUp({Key? key}) : super(key: key);

  @override
  State<DetailPopUp> createState() => _DetailPopUpState();
}

class _DetailPopUpState extends State<DetailPopUp> {
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
                    alignment: Alignment.bottomCenter,
                    child: Transform.rotate(
                      angle: 2 * math.pi/180,
                      child: Image.asset(
                        'assets/human_popup.png',
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.27,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: MediaQuery.of(context).devicePixelRatio*20
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       IconButton(
                  //         onPressed: (){
                  //           Navigator.of(context).pop();
                  //         },
                  //         icon: Icon(
                  //           Icons.arrow_back_ios_new_rounded,
                  //           color: Colors.white,
                  //           size: MediaQuery.of(context).size.height*0.04,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*20,
                ),
                child: Row(
                  children: [
                    Text(
                      "WORK",
                      style: TextStyle(
                        color: Color(0xffF04E75),
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.1,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF04E75),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*4,
                          left: MediaQuery.of(context).devicePixelRatio*1,
                        ),
                        child: Text(
                          "FROM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "HOME",
                      style: TextStyle(
                        color: Color(0xffF04E75),
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: MediaQuery.of(context).size.height*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: Text(
                        "SCG ประกาศนโยบายให้พนักงาน WORK FROM HOME เพื่อป้องกันและลดความเสี่ยงการติดเชื้อ COVID-19",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        maxLines: 4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*5,
                      ),
                      child: Text(
                        "ตั้งแต่วันที่",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffCE3636),
                        ),
                        maxLines: 4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*3,
                      ),
                      child: Text(
                        "8 พฤษภาคม 2565 เป็นต้นไป",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffCE3636),
                        ),
                        maxLines: 4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: Text(
                        "หากต้องการส่งเอกสารมายัง SCG โปรดนำส่งในรูปแบบ เอกสารอิเล็กทรอนิกส์ พร้อมข้อมูลการติดต่อกลับ ผ่าน Email: contact@scg.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFFFFFF).withOpacity(0.3),
                            Color(0xffFCB0C2).withOpacity(0.7),
                          ]
                      )
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF04E75),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*8,
                              ),
                              child: Text(
                                "อ่านแล้วกดรับ ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/coin2.png",
                              width: MediaQuery.of(context).size.width*0.08,
                            ),
                            Text(
                              " 1 เลย ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
