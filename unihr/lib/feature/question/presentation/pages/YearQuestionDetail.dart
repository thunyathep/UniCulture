import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../domain/entity/question_entity.dart';

class YearQuestion extends StatefulWidget {
  final int? idMoraleParticipant;
  final int? idEmployee;
  final int? idMorale;
  final String? status;
  final String? moraleName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? moraleStatus;
  final String? moraleType;
  final List<QuestionTopic>? questionTopic;

  const YearQuestion({Key? key,
    required this.idMoraleParticipant,
    required this.idEmployee,
    required this.idMorale,
    required this.status,
    required this.moraleName,
    required this.startDate,
    required this.endDate,
    required this.moraleStatus,
    required this.moraleType,
    required this.questionTopic,
  }) : super(key: key);

  @override
  State<YearQuestion> createState() => _YearQuestionState();
}

class _YearQuestionState extends State<YearQuestion> {
  int currentAnswer = 0;
  int index = 0;
  String value = "100";
  List<String> items = [
    "Very Happy",
    "Happy",
    "Little Happy",
    "Little Bad",
    "Bad",
    "Very Bad",
  ];

  List<String> images = [
    "assets/very_happy.png",
    "assets/happy.png",
    "assets/not_bad.png",
    "assets/not_good.png",
    "assets/bad.png",
    "assets/very_bad.png",
  ];


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
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset(
                      'assets/top_bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white
                              .withOpacity(0.0), // Start color with opacity
                          Colors.white.withOpacity(1), // End color with opacity
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.035,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context)
                                          .devicePixelRatio *
                                          3,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context)
                                          .devicePixelRatio *
                                          3,
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
                        top: MediaQuery.of(context).devicePixelRatio * 17,
                        left: MediaQuery.of(context).devicePixelRatio * 17),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: MediaQuery.of(context).size.height * 0.08,
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
                                  ]),
                              width: 4,
                            ),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.18,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/Unicorn.gif',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio * 5,
                          ),
                          child: Text(
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
                      top: MediaQuery.of(context).devicePixelRatio * 60,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            widget.questionTopic != null &&
                                index < widget.questionTopic!.length
                                ? widget.questionTopic![index].questionList![index].question ?? ""
                                : "No question available",
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio *
                                  10,
                            ),
                            child: widget.questionTopic![index].questionList![index].questionType == "choice"
                                ?
                            Center(
                              child: SizedBox(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.5,
                                width:
                                MediaQuery.of(context).size.width *
                                    0.6,
                                child: ListView.builder(
                                    itemCount: items.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, Answer) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                              .devicePixelRatio *
                                              5,
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              height:
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.05,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(50),
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    images[Answer],
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.1,
                                                  ),
                                                  Text(
                                                    items[Answer],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                      right: MediaQuery.of(
                                                          context)
                                                          .devicePixelRatio *
                                                          2,
                                                    ),
                                                    child: Image.asset(
                                                      "assets/coin2.png",
                                                      width: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width *
                                                          0.08,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  currentAnswer =
                                                      Answer;
                                                  if (currentAnswer ==
                                                      0) {
                                                    value = "100";
                                                  } else if (currentAnswer ==
                                                      1) {
                                                    value = "80";
                                                  } else if (currentAnswer ==
                                                      2) {
                                                    value = "60";
                                                  } else if (currentAnswer ==
                                                      3) {
                                                    value = "40";
                                                  } else if (currentAnswer ==
                                                      4) {
                                                    value = "20";
                                                  } else if (currentAnswer ==
                                                      5) {
                                                    value = "0";
                                                  }
                                                });
                                                print(value);
                                              },
                                              child: Container(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width *
                                                    0.6,
                                                height: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .height *
                                                    0.05,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(50),
                                                  color: currentAnswer ==
                                                      Answer
                                                      ? Color(0xff757575)
                                                      .withOpacity(
                                                      0.2)
                                                      : Colors
                                                      .transparent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            )
                                : Container(
                              width: MediaQuery.of(context).size.width *
                                  0.9,
                              height:
                              MediaQuery.of(context).size.height *
                                  0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xfff5f5f5),
                              ),
                              child: TextFormField(
                                onChanged: (content) {
                                  // setState(() {
                                  //   detail = value;
                                  // });
                                },
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (content) {
                                  if (content == null || content.isEmpty) {
                                    return 'กรุณากรอกข้อความ';
                                  } else {
                                    return null;
                                  }
                                },
                                maxLines: null,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfff5f5f5),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "คำตอบ",
                                  hintStyle: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Align(
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
                          "ต่อไป",
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
        ),
      ),
    );
  }
}
