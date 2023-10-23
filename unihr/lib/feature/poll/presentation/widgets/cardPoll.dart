import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/poll_entity.dart';
import '../pages/DetailPoll.dart';

class Card_Poll extends StatefulWidget {
  final int idPoll;
  final String poll;
  final DateTime endDate;
  final String status;
  final List<QuestionPollList>? questionPollList;
  final List<VoterList>? voterList;
  const Card_Poll({Key? key,
    required this.idPoll,
    required this.poll,
    required this.endDate,
    required this.status,
    required this.questionPollList,
    required this.voterList,
  }) : super(key: key);

  @override
  State<Card_Poll> createState() => _Card_PollState();
}

class _Card_PollState extends State<Card_Poll> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>DetailPoll(
            idPoll: widget.idPoll,
            poll: widget.poll,
            endDate: widget.endDate,
            status: widget.status,
            questionPollList: widget.questionPollList,
            voterList: widget.voterList,)
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.1,
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
              height: MediaQuery.of(context).size.height*0.16,
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
                        height: MediaQuery.of(context).size.height*0.16,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*15,
                          left: MediaQuery.of(context).devicePixelRatio*5,
                          right: MediaQuery.of(context).devicePixelRatio*5,
                        ),
                        child: Text(
                          widget.poll,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        ),
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
                      Container(
                        child: Text(
                          "End : "+DateFormat("d MMM y").format(widget.endDate),
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*1,
                        ),
                        child: Text(
                          "Vote: -",
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
