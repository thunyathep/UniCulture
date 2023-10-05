import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'package:unihr/feature/threesixty/data/models/threesixty_model.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_bloc.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_event.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_state.dart';
import 'package:unihr/feature/threesixty/presentation/widgets/card_threesixty.dart';
import 'package:unihr/feature/threesixty/presentation/widgets/shimmer_card.dart';

import '../../../../injection_container.dart';
import '../../../question/domain/entity/question_entity.dart';
import '../../domain/entities/threesixty_entity.dart';

class Evaluate extends StatefulWidget {
  const Evaluate({Key? key}) : super(key: key);

  @override
  State<Evaluate> createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  final ThreeSixtyBloc _threeSixtyBloc = sl<ThreeSixtyBloc>();
  late List<ThreeSixtyModel> listquestion;

  @override
  void initState() {
    _threeSixtyBloc.add(GetQuestionThreeSixtyEvent());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _threeSixtyBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocProvider(
            create: (context) => _threeSixtyBloc,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(
                        angle: 2 * math.pi / 180,
                        child: Image.asset(
                          'assets/phone.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.27,
                          fit: BoxFit.contain,
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
                        top: MediaQuery.of(context).devicePixelRatio * 50,
                        left: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'ประเมิน 360 องศา',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BlocBuilder<ThreeSixtyBloc, ThreeSixtyState>(
                    builder: (context, state) {
                  if (state is ThreeSixtyLoadingState) {
                    return ShimmerThreeSixty();
                  } else if (state is ThreeSixtyLoadedState) {
                    listquestion = state.listQuestion;
                    return LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listquestion.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).devicePixelRatio * 7,
                              ),
                              child: CardThreeSixty(
                                idAppraisee:
                                    listquestion[index].idAppraisee ?? 0,
                                idAssessment:
                                    listquestion[index].idAssessment ?? 0,
                                scale: listquestion[index].scale ?? 0,
                                idEmployee: listquestion[index].idEmployee ?? 0,
                                firstname: listquestion[index].firstName ?? "",
                                lastname: listquestion[index].lastName ?? "",
                                position: listquestion[index].position ?? "",
                                department:
                                    listquestion[index].department ?? "",
                                assessmentType:
                                    listquestion[index].assessmentType ?? "",
                                assessmentName:
                                    listquestion[index].assessmentName ?? "",
                                assessmentDescription:
                                    listquestion[index].assessmentDescription ??
                                        "",
                                startdate: listquestion[index].startDate ??
                                    DateTime.now(),
                                enddate: listquestion[index].endDate ??
                                    DateTime.now(),
                                sampleSize: listquestion[index].sampleSize as List<SampleSize>?,
                                questionlist: listquestion[index].questionList
                                    as List<QuestionListThreeSixty>?,
                              ),
                            );
                          });
                    });
                  } else {
                    return Text(state.props.toString());
                  }
                }),
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

  Widget Card_Evaluate(BuildContext, String title, page) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio * 10,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
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
                        height: MediaQuery.of(context).size.height * 0.13,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio * 10,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/pikachu.jpg'),
                          radius: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio * 3,
                            left: MediaQuery.of(context).devicePixelRatio * 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Puttinun Moungprasert",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "HRIS Officer",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "HR Business Partner",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).devicePixelRatio * 3,
                left: MediaQuery.of(context).devicePixelRatio * 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "แบบประเมิน: $title",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "คำอธิบาย: คำอธิบายชุดคำถาม",
                    style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "จำนวน: 7 ข้อ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "ระยะเวลาการประเมิน: 13 กพ. 2565 - 14 กพ. 2565",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
