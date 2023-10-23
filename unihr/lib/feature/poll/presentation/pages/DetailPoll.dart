import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';

import '../../domain/entities/poll_entity.dart';

class DetailPoll extends StatefulWidget {
  final int idPoll;
  final String poll;
  final DateTime endDate;
  final String status;
  final List<QuestionPollList>? questionPollList;
  final List<VoterList>? voterList;
  const DetailPoll({Key? key,
    required this.idPoll,
    required this.poll,
    required this.endDate,
    required this.status,
    required this.questionPollList,
    required this.voterList,
  }) : super(key: key);

  @override
  State<DetailPoll> createState() => _DetailPollState();
}

class _DetailPollState extends State<DetailPoll> {
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
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*1,
                    child: Image.asset(
                      'assets/mission_card.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0), // Start color with opacity
                          Colors.white.withOpacity(0.7), // End color with opacity
                        ],
                      ),
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*20,
                    ),
                    child: Center(
                      child: Text(
                        "โหวต",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*35,
                      ),
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.035,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Color(0xff6ED33F),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.status,
                          style: TextStyle(
                            color: Color(0xff6ED33F),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height*0.04,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: Text(
                      widget.poll,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5,
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
                              "โหวต",
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
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
