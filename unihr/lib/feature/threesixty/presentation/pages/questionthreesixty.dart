import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

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
  final List<QuestionListThreeSixty>? questionlist;

  ThreeSixtyQuestion({Key? key,
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
    required this.questionlist,
  }) : super(key: key);

  @override
  State<ThreeSixtyQuestion> createState() => _ThreeSixtyQuestionState();
}


class _ThreeSixtyQuestionState extends State<ThreeSixtyQuestion> {
  ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);
  int index = 0;

  @override
  void initState() {
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
    int numberofQuestion = widget.questionlist!.length;
    int indexofQuestion = numberofQuestion - 1;

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
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
                      top: MediaQuery.of(context).devicePixelRatio * 60,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            widget.questionlist != null && index < widget.questionlist!.length
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
                              top: MediaQuery.of(context).devicePixelRatio*10,
                            ),
                            child: widget.assessmentType == "close" ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/very_happy.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Very Happy",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/happy.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Happy",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/not_bad.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Little Happy",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/not_good.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Little Bad",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/bad.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Bad",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio * 5,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      height:
                                      MediaQuery.of(context).size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            "assets/very_bad.png",
                                            width: MediaQuery.of(context).size.width *
                                                0.1,
                                          ),
                                          Text(
                                            "Very Bad",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                                  2,
                                            ),
                                            child: Image.asset(
                                              "assets/coin2.png",
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.08,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ) :
                            Container(
                              width: MediaQuery.of(context).size.width*0.9,
                              height: MediaQuery.of(context).size.height*0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xfff5f5f5),
                              ),
                              child: TextFormField(
                                onChanged: (value){
                                  // setState(() {
                                  //   detail = value;
                                  // });
                                },
                                autovalidateMode: AutovalidateMode
                                    .onUserInteraction,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty) {
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
                                    borderRadius: BorderRadius.circular(50),
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
                      });
                    } else if (index == indexofQuestion ) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
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
                    child: index == indexofQuestion ? Text(
                      "ส่งแบบประเมิน",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ) : Text(
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
    );
  }

}
