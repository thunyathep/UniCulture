import 'package:flutter/material.dart';

import '../../pages/poll/DetailPoll.dart';

class Card_Poll extends StatefulWidget {
  const Card_Poll({Key? key}) : super(key: key);

  @override
  State<Card_Poll> createState() => _Card_PollState();
}

class _Card_PollState extends State<Card_Poll> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>DetailPoll()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio*10,
        ),
        width: MediaQuery.of(context).size.width*0.8,
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
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.13,
              child: Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      child: Image.asset(
                        "assets/mission_card.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.13,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.13,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Topic",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
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
                    top: MediaQuery.of(context).devicePixelRatio*3,
                    left: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End : 10 Jan 4041",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*1,
                        ),
                        child: Text(
                          "Vote: 25.00%",
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*5,
                    right: MediaQuery.of(context).devicePixelRatio*10,
                  ),
                  width: MediaQuery.of(context).size.width*0.2,
                  height: MediaQuery.of(context).size.height*0.025,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff6ED33F),
                  ),
                  child: Center(
                    child: Text(
                      "โหวต",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
