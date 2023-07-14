import 'package:flutter/material.dart';

import '../../pages/misson/DetailMission.dart';

class Card_Mission extends StatefulWidget {
  const Card_Mission({Key? key}) : super(key: key);

  @override
  State<Card_Mission> createState() => _Card_MissionState();
}

class _Card_MissionState extends State<Card_Mission> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>DetailMission()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio*10,
        ),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/mission_card.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*5,
                      left: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: Text(
                      "Topic",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).devicePixelRatio*2,
                left: MediaQuery.of(context).devicePixelRatio*10,
              ),
              child: Text(
                "วันที่ได้รับมอบหมาย : 27 May 4070",
                style: TextStyle(
                  color: Color(0xff757575),
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).devicePixelRatio*2,
                left: MediaQuery.of(context).devicePixelRatio*10,
                right: MediaQuery.of(context).devicePixelRatio*10,
              ),
              child: Text(
                "ไปตีแบดกัน",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff757575),
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*8,
                        left: MediaQuery.of(context).devicePixelRatio*10,
                        right: MediaQuery.of(context).devicePixelRatio*2,
                      ),
                      child: Icon(
                        Icons.group,
                        color: Color(0xff757575),
                        size: MediaQuery.of(context).devicePixelRatio*6,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*7,
                      ),
                      child: Text(
                        "สถานะกิจกรรม : ",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*7,
                      ),
                      width: MediaQuery.of(context).size.width*0.15,
                      height: MediaQuery.of(context).size.height*0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff6ED33F),
                      ),
                      child: Center(
                        child: Text(
                          "approve",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*5,
                      ),
                      child: Image.asset(
                        "assets/coin2.png",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width*0.08,
                        height: MediaQuery.of(context).size.width*0.08,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*5,
                        right: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: Text(
                        " x5",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
