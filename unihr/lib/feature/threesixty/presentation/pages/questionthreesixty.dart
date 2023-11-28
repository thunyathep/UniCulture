import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_bloc.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_event.dart';
import 'dart:math' as math;

import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../injection_container.dart';
import '../../../pocket/presentation/widget/show_coin.dart';
import '../../domain/entities/threesixty_entity.dart';

class ThreeSixtyQuestion extends StatefulWidget {
  final int idAppraisee;
  final int idAssessment;
  final int scale;
  final int idEmployee;
  final String firstname;
  final String lastname;
  final String position;
  final String department;
  final String assessmentName;
  final String assessmentType;
  final String assessmentDescription;
  final DateTime startdate;
  final DateTime enddate;
  final List<SampleSize>? sampleSize;
  final List<QuestionListThreeSixty>? questionlist;

  ThreeSixtyQuestion({
    Key? key,
    required this.idAppraisee,
    required this.idAssessment,
    required this.idEmployee,
    required this.scale,
    required this.firstname,
    required this.lastname,
    required this.position,
    required this.department,
    required this.assessmentName,
    required this.assessmentType,
    required this.assessmentDescription,
    required this.startdate,
    required this.enddate,
    required this.sampleSize,
    required this.questionlist,
  }) : super(key: key);

  // Method to get idAppraisee_SampleSize for the given idEmployee
  List<int> getIdAppraiseeSampleSize(int idUser) {
    List<int> idAppraiseeSampleSizeList = [];

    if (sampleSize != null) {
      for (var size in sampleSize!) {
        if (size.idAppraiser == idUser) {
          idAppraiseeSampleSizeList.add(size.idAppraiseeSampleSize!);
        }
      }
    }
    return idAppraiseeSampleSizeList;
  }

  @override
  State<ThreeSixtyQuestion> createState() => _ThreeSixtyQuestionState();
}

class _ThreeSixtyQuestionState extends State<ThreeSixtyQuestion> {
  late ProfileProvider profileProvider;
  late AnswerQuestionToJson answerQuestion;
  ThreeSixtyBloc _threeSixtyBloc = sl<ThreeSixtyBloc>();
  ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  String value = "100";
  int index = 0;
  int idUser = 0;
  int currentAnswer = 0;
  List<int> idAppraiseeSampleSize = [];
  int idAssessmentQuestion = 0;
  final List<AnswerQuestionToJson> dataAnswerArray = [];

  Future<void> getId() async {
    String id = await LoginStorage.readEmployeeId();
    try {
      idUser = int.parse(id);
      // Now, you can use idSender as an int.
      print("Parsed integer ID: $idUser");
    } catch (e) {
      // Handle the case where the string cannot be parsed as an integer.
      print("Error parsing string to int: $e");
    }
  }

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
  void initState() {
    getId();
    profileProvider = ProfileProvider.of(context, listen: false);
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    indexNotifier.dispose();
    super.dispose();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    int numberofQuestion = widget.questionlist!.length;
    int indexofQuestion = numberofQuestion - 1;
    ThreeSixtyQuestion questionInstance = ThreeSixtyQuestion(
      idAppraisee: widget.idAppraisee,
      idAssessment: widget.idAssessment,
      idEmployee: widget.idEmployee,
      scale: widget.scale,
      firstname: widget.firstname,
      lastname: widget.lastname,
      position: widget.position,
      department: widget.department,
      assessmentName: widget.assessmentName,
      assessmentType: widget.assessmentType,
      assessmentDescription: widget.assessmentDescription,
      startdate: widget.startdate,
      enddate: widget.enddate,
      sampleSize: widget.sampleSize,
      questionlist: widget.questionlist,
    );
    idAppraiseeSampleSize = questionInstance.getIdAppraiseeSampleSize(idUser);

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _threeSixtyBloc,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.88,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.88,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white
                                .withOpacity(0.0), // Start color with opacity
                            Colors.white
                                .withOpacity(1), // End color with opacity
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
                          ShowCoin(),
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
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                "${profileProvider.profileData.firstName??"ไม่ระบุ"}" +
                                    " " +
                                    "${profileProvider.profileData.lastName??"ไม่ระบุ"}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
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
                              widget.questionlist != null &&
                                      index < widget.questionlist!.length
                                  ? widget.questionlist![index].question ?? ""
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
                              child: widget.assessmentType == "close"
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
                InkWell(
                  onTap: () {
                    if (index != indexofQuestion) {
                      setState(() {
                        index = index + 1;
                        answerQuestion = AnswerQuestionToJson(
                            idAppraiseeSampleSize: idAppraiseeSampleSize[0],
                            idAssessmentQuestion: widget.questionlist![index]
                                    .idAssessmentQuestion ??
                                0,
                            value: value);
                        dataAnswerArray.add(answerQuestion);
                        value = "100";
                        currentAnswer = 0;
                      });
                    } else if (index == indexofQuestion) {
                      answerQuestion = AnswerQuestionToJson(
                          idAppraiseeSampleSize: idAppraiseeSampleSize[0],
                          idAssessmentQuestion: widget
                                  .questionlist![index].idAssessmentQuestion ??
                              0,
                          value: value);
                      dataAnswerArray.add(answerQuestion);
                      _threeSixtyBloc.add(AnswerThreeSixty(
                          answerList: dataAnswerArray));
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.05,
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
                          ]),
                    ),
                    child: Center(
                      child: index == indexofQuestion
                          ? Text(
                              "ส่งแบบประเมิน",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          : Text(
                              "ต่อไป",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
