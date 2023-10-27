import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'package:unihr/feature/score/data/model/score_model.dart';
import 'package:unihr/feature/score/presentation/bloc/score_bloc.dart';
import 'package:unihr/feature/score/presentation/bloc/score_state.dart';
import 'dart:math' as math;

import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../bloc/score_event.dart';
import '../widget/Card_Score.dart';
import 'AllScore.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  final ScoreBloc _scoreBloc = ScoreBloc();
  late List<ScoreModel> listscore;
  late ProfileProvider profileProvider;
  int current = 0;
  int rank = 3;
  List<String> items = [
    "หัวใจ",
    "เหรียญ",
  ];

  @override
  void initState() {
    profileProvider = ProfileProvider.of(context, listen: false);
    _scoreBloc.add(GetScore(current));
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _scoreBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _scoreBloc,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          'assets/coin_score.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.27,
                          fit: BoxFit.cover,
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
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.024,
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                "${profileProvider.profileData.firstName??"ไม่ระบุ"}" +
                                    " " +
                                    "${profileProvider.profileData.lastName??"ไม่ระบุ"}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
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
                            'ตารางคะแนน',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio * 2,
                              right:
                                  MediaQuery.of(context).devicePixelRatio * 5,
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xff5B4589), //<-- SEE HERE
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: ListView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio * 5,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                                // _feedbackBloc.add(GetFeedback(current));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xff757575).withOpacity(0.3),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  gradient: current == index
                                      ? LinearGradient(
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft,
                                          colors: [
                                            Color(0xffFCB0C2),
                                            Color(0xffF4BFCF),
                                            Color(0xffF0C5F1),
                                            Color(0xffE3DEF4),
                                            Color(0xffC1E1E7),
                                            Color(0xffC1E1E6),
                                          ],
                                        )
                                      : null,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        12,
                                  ),
                                  child: Row(
                                    children: [
                                      index == 0
                                          ? SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              child: Image.asset(
                                                "assets/heart.png",
                                              ),
                                            )
                                          : SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              child: Image.asset(
                                                "assets/coin2.png",
                                              ),
                                            ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              2,
                                        ),
                                        child: Text(
                                          items[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 10,
                    left: MediaQuery.of(context).devicePixelRatio * 10,
                  ),
                  child: Text(
                    "Top 10",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlocBuilder<ScoreBloc, ScoreState>(
                  builder: (context, state) {
                    if(state is ScoreLoadingState){
                      return Text("");
                    }else if(state is ScoreLoadedState){
                      listscore = state.listscore;
                      return Column(
                        children: [
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: MediaQuery.of(context).size.height * 0.3,
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.283,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.25,
                                        color: Color(0xffFCB0C2),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.283,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white.withOpacity(
                                                    0.7), // Start color with opacity
                                                Colors.white.withOpacity(
                                                    1), // End color with opacity
                                              ],
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          5,
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Container(
                                                      width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.2,
                                                      height:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.1,
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/profilepic.png'),
                                                        radius: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      Alignment(0.7, 1),
                                                      child: Stack(
                                                        children: [
                                                          current == 0 ? Image.asset(
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
                                                                0.16,
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
                                                                0.16,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                              left: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  2.5,
                                                              top: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  17,
                                                            ),
                                                            child: Text(
                                                              listscore[1].amount.toString(),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color:
                                                                Colors.white,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          37,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          3,
                                                    ),
                                                    child: Text(
                                                      listscore[1].firstName! + " " + listscore[1].lastName!,
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          42,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Text(
                                                      listscore[1].departmentShortName!,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.283,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.25,
                                        color: Color(0xffFCB0C2),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.283,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white.withOpacity(
                                                    0.2), // Start color with opacity
                                                Colors.white.withOpacity(
                                                    1), // End color with opacity
                                              ],
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          5,
                                                    ),
                                                    child: Container(
                                                      width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.2,
                                                      height:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.1,
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/pikachu.jpg'),
                                                        radius: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          1,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      Alignment(0.7, 1),
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
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
                                                                0.16,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                              left: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  2.5,
                                                              top: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  17,
                                                            ),
                                                            child: Text(
                                                              "30",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color:
                                                                Colors.white,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          27,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          3,
                                                    ),
                                                    child: Text(
                                                      "นายสัญจร นอนดึก",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          32,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Text(
                                                      "Logistc",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.283,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.25,
                                        color: Color(0xffFCB0C2),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              0.283,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white.withOpacity(
                                                    0.7), // Start color with opacity
                                                Colors.white.withOpacity(
                                                    1), // End color with opacity
                                              ],
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          5,
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Container(
                                                      width:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.2,
                                                      height:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                          0.1,
                                                      child: CircleAvatar(
                                                        backgroundImage: AssetImage(
                                                            'assets/pikachu.jpg'),
                                                        radius: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      Alignment(0.7, 1),
                                                      child: Stack(
                                                        children: [
                                                          Image.asset(
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
                                                                0.16,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                              left: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  2.5,
                                                              top: MediaQuery.of(
                                                                  context)
                                                                  .devicePixelRatio *
                                                                  17,
                                                            ),
                                                            child: Text(
                                                              "30",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color:
                                                                Colors.white,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          37,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          3,
                                                    ),
                                                    child: Text(
                                                      "นายสัญจร นอนดึก",
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          42,
                                                      left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                          10,
                                                    ),
                                                    child: Text(
                                                      "Logistc",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.1,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //   top: MediaQuery.of(context).devicePixelRatio*40,
                                        // ),
                                        width: MediaQuery.of(context).size.width *
                                            0.85,
                                        child: Image.asset(
                                          "assets/podium.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                            itemCount: 7,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              index = rank;
                              rank++;
                              return CardScore(context, index + 1);
                            },
                          ),
                        ],
                      );
                    }else{
                      return Text(state.props.toString());
                    }
                  },
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AllScore()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 5,
                      ),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff757575).withOpacity(0.25),
                      ),
                      child: Center(
                        child: Text(
                          "ดูทั้งหมด",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
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
}
