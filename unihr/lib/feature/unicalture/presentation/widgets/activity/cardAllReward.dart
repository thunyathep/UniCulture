import 'package:flutter/material.dart';

import '../../pages/activity/DetailReward.dart';

class CardAllReward extends StatefulWidget {
  const CardAllReward({Key? key}) : super(key: key);

  @override
  State<CardAllReward> createState() => _CardAllRewardState();
}

class _CardAllRewardState extends State<CardAllReward> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailReward()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        height: MediaQuery.of(context).size.height*0.25,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).devicePixelRatio*10,
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).devicePixelRatio*5,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.2,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset('assets/air_fryer.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    'Hanabishi หม้อทอดไร้น้ำมัน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*2,
                    bottom: MediaQuery.of(context).devicePixelRatio*2,
                  ),
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: Column(
                    children: const [
                      Expanded(
                        child: Text(
                          "Hanabishi หม้อทอดไร้น้ำมัน 4 ลิตรรุ่น HAF-001 - 4 ลิตร",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  "หมดเขต: 31 Mar 2023",
                  style: TextStyle(
                    fontSize: 8,
                    color:  Color(0xff757575),
                  ),
                ),

                Text(
                  "คลัง: 9",
                  style: TextStyle(
                    fontSize: 8,
                    color:  Color(0xff757575),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/heart.png',
                          width: MediaQuery.of(context).size.width*0.07,
                          height: MediaQuery.of(context).size.height*0.07,
                        ),
                        Text('x10'),
                      ],
                    ),
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
