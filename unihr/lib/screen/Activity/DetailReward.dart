import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class DetailReward extends StatefulWidget {
  const DetailReward({Key? key}) : super(key: key);

  @override
  State<DetailReward> createState() => _DetailRewardState();
}

class _DetailRewardState extends State<DetailReward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white.withOpacity(0.0), // Start color with opacity
                              Color(0xffE299AA).withOpacity(0.5), // End color with opacity
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.25,
                        color: Colors.transparent,
                        child: Image.asset(
                          "assets/air_fryer2.png",
                          fit: BoxFit.contain,
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.0), // Start color with opacity
                              Color(0xffE299AA).withOpacity(0.7), // End color with opacity
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*20,
                      left: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                        size: MediaQuery.of(context).size.width*0.07,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.55,
                        width: MediaQuery.of(context).size.width*1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*10,
                                top: MediaQuery.of(context).devicePixelRatio*5,
                                bottom: MediaQuery.of(context).devicePixelRatio*2,
                                right: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: Text(
                                "Hanabishi หม้อทอดไร้น้ำมัน",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*2,
                                bottom: MediaQuery.of(context).devicePixelRatio*2,
                                left: MediaQuery.of(context).devicePixelRatio*10,
                                right: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: Text(
                                "คลัง : 9",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*2,
                                bottom: MediaQuery.of(context).devicePixelRatio*2,
                                left: MediaQuery.of(context).devicePixelRatio*10,
                                right: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: Text(
                                "anabishi หม้อทอดไร้น้ำมัน 4 ลิตร รุ่น HAF-001 - 4 ลิตร",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*2,
                                bottom: MediaQuery.of(context).devicePixelRatio*2,
                                left: MediaQuery.of(context).devicePixelRatio*10,
                                right: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/coin.png',
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width*0.08,
                                    height: MediaQuery.of(context).size.width*0.08,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*3,
                                      right: MediaQuery.of(context).devicePixelRatio*5,
                                    ),
                                    child: Text("x3",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/heart.png',
                                    fit: BoxFit.contain,
                                    width: MediaQuery.of(context).size.width*0.08,
                                    height: MediaQuery.of(context).size.width*0.08,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*3,
                                      right: MediaQuery.of(context).devicePixelRatio*2,
                                    ),
                                    child: Text("x10",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                      bottom: MediaQuery.of(context).devicePixelRatio*2,
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                      right: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                  child: Text(
                                    "จำนวน",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio*5,
                                    right: MediaQuery.of(context).devicePixelRatio*10,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                      width: 2.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.125,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              width: 2.5,
                                              color: Color(0xffFCB0C2),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: (){},
                                            icon: Icon(
                                              Icons.remove,
                                              color: Color(0xffFCB0C2),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.125,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        child: Center(
                                          child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Color(0xffFCB0C2),
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.125,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              width: 2.5,
                                              color: Color(0xffFCB0C2),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: (){},
                                            icon: Icon(
                                              Icons.add,
                                              color: Color(0xffFCB0C2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).devicePixelRatio*2,
                                    left: MediaQuery.of(context).devicePixelRatio*10,
                                    right: MediaQuery.of(context).devicePixelRatio*10,
                                  ),
                                  child: Text(
                                    "รวม",
                                    style: TextStyle(
                                      color: Color(0xff757575),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/coin.png',
                                          fit: BoxFit.contain,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          height: MediaQuery.of(context).size.width*0.08,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context).devicePixelRatio*3,
                                            right: MediaQuery.of(context).devicePixelRatio*5,
                                          ),
                                          child: Text("x3",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/heart.png',
                                          fit: BoxFit.contain,
                                          width: MediaQuery.of(context).size.width*0.08,
                                          height: MediaQuery.of(context).size.width*0.08,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context).devicePixelRatio*3,
                                            right: MediaQuery.of(context).devicePixelRatio*5,
                                          ),
                                          child: Text("x10",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0)), //this right here
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.27,
                                            width: MediaQuery.of(context).size.width*0.8,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*5,
                                                  ),
                                                  child: Text(
                                                    "ยืนยันการแลกของรางวัล",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*5,
                                                  ),
                                                  child: Text(
                                                    "Hanabishi หม้อทอดไร้น้ำมัน",
                                                    style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*2,
                                                  ),
                                                  child: Text(
                                                    "anabishi หม้อทอดไร้น้ำมัน 4 ลิตร รุ่น HAF-001 - 4 ลิตร",
                                                    style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),


                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*0.6,
                                                      height: MediaQuery.of(context).size.height*0.05,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Color(0xff5581F1),
                                                          width: 2,
                                                        )
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "ยกเลิก",
                                                          style: TextStyle(
                                                            color: Color(0xff5581F1),
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),


                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.of(context).pop();
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return Scaffold(
                                                            backgroundColor: Colors.transparent,
                                                            body: SafeArea(
                                                              child: Stack(
                                                                children: [
                                                                  // Confetti GIF as the background
                                                                  Positioned.fill(
                                                                    child: Image.asset(
                                                                      'assets/confetti.gif',
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  // Centered Dialog Container
                                                                  Dialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0)), //this right here
                                                                    child: Container(
                                                                      height: MediaQuery.of(context)
                                                                          .size
                                                                          .height *
                                                                          0.38,
                                                                      width: MediaQuery.of(context)
                                                                          .size
                                                                          .width *
                                                                          0.8,
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .end,
                                                                            children: [
                                                                              IconButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(
                                                                                      context)
                                                                                      .pop();
                                                                                },
                                                                                icon: Icon(Icons
                                                                                    .clear_rounded),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Center(
                                                                            child: Image.asset(
                                                                              "assets/air_fryer2.png",
                                                                              width: MediaQuery
                                                                                  .of(context)
                                                                                  .size
                                                                                  .width
                                                                                  *0.3,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "สำเร็จ!",
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 40,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "แลกของรางวัลแล้ว",
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 24,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*2,
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*0.6,
                                                      height: MediaQuery.of(context).size.height*0.05,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color: Color(0xff5581F1),
                                                          border: Border.all(
                                                            color: Color(0xff5581F1),
                                                            width: 2,
                                                          )
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "ยืนยัน",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio*10,
                                  ),
                                  width: MediaQuery.of(context).size.width*0.7,
                                  height: MediaQuery.of(context).size.height*0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xffFCB0C2),
                                          Color(0xffF4BFCF),
                                          Color(0xffF0C5F1),
                                          Color(0xffE3DEF4),
                                          Color(0xffC1E1E7),
                                          Color(0xffC1E1E6),
                                        ]
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "แลกของรางวัล",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
