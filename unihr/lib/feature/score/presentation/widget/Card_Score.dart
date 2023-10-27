import 'package:flutter/material.dart';

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
