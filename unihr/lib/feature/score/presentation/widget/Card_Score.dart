import 'package:flutter/material.dart';

class CardScore extends StatelessWidget {
  final BuildContext context;
  final int number;
  final String firstName;
  final String lastName;
  final String departmentShortName;
  final int amount;
  final int icontype;

  const CardScore(this.context, this.number, this.firstName, this.lastName, this.departmentShortName, this.amount, this.icontype);

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
                      backgroundImage: AssetImage('assets/profilepic.png'),
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
                          firstName + " " + lastName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          departmentShortName,
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
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 6,
                    ),
                    // width: MediaQuery.of(context).size.width * 0.1,
                    // height: MediaQuery.of(context).size.height * 0.08,
                    child: icontype == 0 ? Image.asset(
                      "assets/heart.png",
                      width: MediaQuery.of(
                          context)
                          .size
                          .width *
                          0.08,
                      height: MediaQuery.of(
                          context)
                          .size
                          .height *
                          0.06,
                    ):Image.asset(
                      "assets/coin2.png",
                      width: MediaQuery.of(
                          context)
                          .size
                          .width *
                          0.08,
                      height: MediaQuery.of(
                          context)
                          .size
                          .height *
                          0.06,
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
