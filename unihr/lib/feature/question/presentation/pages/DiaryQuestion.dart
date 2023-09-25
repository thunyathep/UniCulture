import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'package:unihr/feature/question/data/model/moralediary_model.dart';
import 'dart:math' as math;

import 'package:unihr/feature/question/presentation/bloc/question_bloc.dart';
import 'package:unihr/feature/question/presentation/bloc/question_event.dart';
import 'package:unihr/feature/question/presentation/bloc/question_state.dart';

class DiaryQuestion extends StatefulWidget {
  const DiaryQuestion({Key? key}) : super(key: key);

  @override
  State<DiaryQuestion> createState() => _DiaryQuestionState();
}


class _DiaryQuestionState extends State<DiaryQuestion> {
  final QuestionBloc _questionBloc = QuestionBloc();
  late List<MoraleDiaryModel> listmoralediary;


  @override
  void initState() {
    _questionBloc.add(GetMoraleDiary());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _questionBloc.close();
    _isDisposed = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<QuestionBloc>(
              create: (_) => _questionBloc,
            ),
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
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
                      child: BlocBuilder<QuestionBloc, QuestionState>(
                        builder: (context, state){
                          if(state is MoraleDiaryLoadingState){
                            return Text("");
                          }else if(state is MoraleDiaryLoadedState){
                            listmoralediary = state.listmoralediary;
                            if(listmoralediary.isEmpty){
                              return Text("");

                            }else{
                              return Center(
                                child: Column(
                                  children: [
                                    Text(
                                      listmoralediary[0].question??"",
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).devicePixelRatio * 15,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Scaffold(
                                                  backgroundColor: Colors.transparent,
                                                  body: SafeArea(
                                                    child: Stack(
                                                      children: [
                                                        // Confetti GIF as the background
                                                        // Positioned.fill(
                                                        //   child: Image.asset(
                                                        //     'assets/confetti.gif',
                                                        //     fit: BoxFit.cover,
                                                        //   ),
                                                        // ),
                                                        // Centered Dialog Container
                                                        Dialog(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  20.0)), //this right here
                                                          child: Container(
                                                            height: MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                                0.38,
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.8,
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () {
                                                                        Navigator.of(
                                                                            context)
                                                                            .pop();
                                                                      },
                                                                      icon: Icon(Icons
                                                                          .clear_rounded),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Center(
                                                                  child: Image.asset(
                                                                    "assets/coin2.png",
                                                                    width: MediaQuery
                                                                        .of(context)
                                                                        .size
                                                                        .width
                                                                        *0.3,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "ยินดีด้วย",
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 40,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "คุณได้รับ 1 เหรียญทอง",
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 24,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
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
                                        onTap: () async {
                                          bool isAllowed = await checkNotificationStatus();
                                          if (isAllowed) {
                                            print('Notifications are enabled');
                                          } else {
                                            print('Notifications are not enabled');
                                          }
                                        },
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
                                ),
                              );
                            }
                          }else{
                            return Text(state.props.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> checkNotificationStatus() async {
    return await AwesomeNotifications().isNotificationAllowed();
  }
}
