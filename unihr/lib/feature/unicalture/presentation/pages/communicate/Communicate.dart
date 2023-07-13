import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;
import 'package:drop_shadow_image/drop_shadow_image.dart';



import '../heartfeature/Search.dart';
import '../popup/DetailPopUp.dart';
import 'Suggestion.dart';

class Communicate extends StatefulWidget {
  const Communicate({Key? key}) : super(key: key);

  @override
  State<Communicate> createState() => _CommunicateState();
}

class _CommunicateState extends State<Communicate> {
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
                        'assets/communicate.png',
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.27,
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
                          'การสื่อสาร',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Scaffold(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              body: SafeArea(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Centered Dialog Container
                                    Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height*0.15,
                                              width: MediaQuery.of(context).size.height*0.8,
                                            ),
                                            Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.0)), //this right here
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.5,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.8,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                      child: Image.asset(
                                                        "assets/pop_up.png",
                                                        height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.5,
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.8,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            top: MediaQuery.of(context).devicePixelRatio*10,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "WORK",
                                                                style: TextStyle(
                                                                  color: Color(0xffF04E75),
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 32,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(context).size.width*0.1,
                                                                height: MediaQuery.of(context).size.height*0.04,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Color(0xffF04E75),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                    top: MediaQuery.of(context).devicePixelRatio*3,
                                                                    left: MediaQuery.of(context).devicePixelRatio*1.5,
                                                                  ),
                                                                  child: Text(
                                                                    "FROM",
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 11,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "HOME",
                                                                style: TextStyle(
                                                                  color: Color(0xffF04E75),
                                                                  fontSize: 32,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                                            right: MediaQuery.of(context).devicePixelRatio*10,
                                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Text(
                                                            "SCG ประกาศนโยบายให้พนักงาน WORK FROM HOME เพื่อป้องกันและลดความเสี่ยงการติดเชื้อ COVID-19",
                                                            maxLines: 3,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                                          ),
                                                          child: Text(
                                                            "ตั้งแต่วันที่",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color(0xffF04E75),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                                          ),
                                                          child: Text(
                                                            "8 พฤษภาคม 2565 เป็นต้นไป",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              color: Color(0xffF04E75),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: MediaQuery.of(context).size.height*0.212,
                                                          width: MediaQuery.of(context).size.width,
                                                          margin: EdgeInsets.only(
                                                            top: MediaQuery.of(context).devicePixelRatio*2,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/human_popup.png",
                                                            fit: BoxFit.cover,
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
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context).devicePixelRatio*10,
                                            ),
                                            child: Image.asset(
                                              "assets/megaphone.png",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>DetailPopUp()),
                                        );
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.6,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xffF04E75),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*10,
                                                right: MediaQuery.of(context).devicePixelRatio*3,
                                              ),
                                              child: Text(
                                                "อ่านต่อเพื่อรับ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                                "assets/coin2.png",
                                              width: MediaQuery.of(context).size.width*0.07,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*3,
                                              ),
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: MediaQuery.of(context).devicePixelRatio*5,
                                        ),
                                        width: MediaQuery.of(context).size.width*0.4,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*20,
                                              ),
                                              child: Text(
                                                "ปิด",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
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
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.95,
                      height: MediaQuery.of(context).size.height*0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          DropShadowImage(
                            offset: Offset(3,3),
                            scale: 1,
                            blurRadius: 0,
                            borderRadius: 5,
                            image: Image.asset(
                              "assets/bg_commu.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width*1,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                ),
                                child: Text(
                                  "ประกาศข่าว",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Image.asset(
                                "assets/megaphone.png",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>Suggestion())
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      width: MediaQuery.of(context).size.width*0.95,
                      height: MediaQuery.of(context).size.height*0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          DropShadowImage(
                            offset: Offset(3,3),
                            scale: 1,
                            blurRadius: 0,
                            borderRadius: 5,
                            image: Image.asset(
                              "assets/bg_commu.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width*1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio*45,
                            ),
                            child: Image.asset(
                              "assets/chatbox.png",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width*0.7,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*25,
                              left: MediaQuery.of(context).devicePixelRatio*10,
                            ),
                            child: Text(
                              "พูดคุยเสนอแนะ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
