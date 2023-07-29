import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_event.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_state.dart';
import 'package:unihr/feature/unicalture/presentation/pages/bottomnav/BottomNavigate.dart';
import 'package:unihr/feature/unicalture/presentation/pages/poll/Poll.dart';
import 'package:unihr/feature/unicalture/presentation/pages/question/EvaluateThreeSixty.dart';
import 'package:unihr/feature/unicalture/presentation/pages/question/YearQuestion.dart';
import 'package:unihr/feature/unicalture/presentation/pages/score/Score.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardActivity.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardReward.dart';
import '../../../activity/presentation/pages/MyActivity.dart';
import '../../../reward/presentation/pages/redeem_reward.dart';
import '../../data/model/reward_model.dart';
import '../widget/buttonNav.dart';
import '../../../activity/presentation/pages/AllActivity.dart';
import '../../../reward/presentation/pages/MyReward.dart';
import '../../../unicalture/presentation/pages/question/DiaryQuestion.dart';
import '../../../pocket/presentation/pages/Pocket.dart';
import '../../../unicalture/presentation/pages/heartfeature/SentHeart.dart';
import '../../../unicalture/presentation/pages/communicate/Communicate.dart';
import '../../../unicalture/presentation/pages/feedback/feedBack.dart';
import '../../../unicalture/presentation/pages/misson/MyMission.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final HomepageBloc _homepageBloc = HomepageBloc();
  late List<RewardModel> listreward;

  @override
  void initState() {
    _homepageBloc.add(GetReward());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _homepageBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: BlocProvider(
              create: (_) => _homepageBloc,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.3,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/top_bar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white
                                    .withOpacity(0.0),
                                // Start color with opacity
                                Colors.white.withOpacity(1),
                                // End color with opacity
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .devicePixelRatio * 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  "assets/Unicorn.gif",
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.6,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .devicePixelRatio * 40,
                            left: MediaQuery
                                .of(context)
                                .devicePixelRatio * 5,
                          ),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFFFDD87),
                                          Color(0xFFFFF5E2),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 10,
                                          spreadRadius: 5,
                                        )
                                      ],
                                    ),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.13,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                7,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                          ),
                                          child: const Text(
                                            "เหรียญทองที่ได้รับ",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                25,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                          ),
                                          child: const Text(
                                            "25",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                3,
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                15,
                                          ),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.022,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.22,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50)),
                                            color: Color(0xFFFFC355),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .devicePixelRatio *
                                                  2,
                                              top: MediaQuery
                                                  .of(context)
                                                  .devicePixelRatio *
                                                  0.5,
                                            ),
                                            child: Text(
                                              "แลกของรางวัล",
                                              style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .devicePixelRatio *
                                          15,
                                      left: MediaQuery
                                          .of(context)
                                          .devicePixelRatio *
                                          30,
                                    ),
                                    child: Image.asset("assets/gold.png"),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio * 9,
                                      vertical:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio *
                                          10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFEC6C8B),
                                          Color(0xFFFFF8FA),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 10,
                                          spreadRadius: 5,
                                        )
                                      ],
                                    ),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.13,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                17,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                          ),
                                          child: const Text(
                                            "หัวใจที่ได้รับ",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                25,
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                2,
                                          ),
                                          child: const Text(
                                            "10",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                3,
                                            right: MediaQuery
                                                .of(context)
                                                .devicePixelRatio *
                                                15,
                                          ),
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.022,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.22,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50)),
                                            color: Color(0xFFEC6C8B),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery
                                                  .of(context)
                                                  .devicePixelRatio *
                                                  2,
                                              top: MediaQuery
                                                  .of(context)
                                                  .devicePixelRatio *
                                                  0.5,
                                            ),
                                            child: Text(
                                              "ส่งหัวใจ(9/10)",
                                              style: TextStyle(
                                                fontSize: 12,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery
                                          .of(context)
                                          .devicePixelRatio *
                                          24,
                                      left: MediaQuery
                                          .of(context)
                                          .devicePixelRatio *
                                          38,
                                    ),
                                    child: Image.asset("assets/holdheart.png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ButtonFeature(feature: "กระเป๋า\nเหรียญ",
                                  image: 'assets/pocket.png',pages: Pocket()),
                              ButtonFeature(
                                  feature: "รับส่ง\nหัวใจ",
                                  image: 'assets/sentHeart.png',pages: SentHeart()),
                              ButtonFeature(feature: "ฟีดแบค\n",
                                  image: 'assets/feedback.png',pages: FeedBack()),
                              ButtonFeature(
                                  feature: "แลกของ\nรางวัล",
                                  image: 'assets/reward.png',pages: AllReward()),
                              ButtonFeature(
                                  feature: "ภาระกิจ\nของฉัน",
                                  image: 'assets/mission.png',pages: MyMission()),
                              ButtonFeature(
                                  feature: "การสื่อสาร\n",
                                  image: 'assets/commuIcon.png',pages: Communicate()),
                              ButtonFeature(feature: "ตาราง\nคะแนน",
                                  image: 'assets/score.png',pages: ScorePage()),
                              ButtonFeature(feature: "ผลโหวต\n",
                                  image: 'assets/pollicon.png',pages: PollPage()),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio * 5,
                                      top:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio * 5,
                                    ),
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio * 5,
                                      top:
                                      MediaQuery
                                          .of(context)
                                          .devicePixelRatio * 2,
                                    ),
                                    child: Text(
                                      "\n\n\n",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ButtonFeature(
                                  feature: "กิจกรรม\nของฉัน\n",
                                  image: 'assets/myactivity.png',pages: MyActivity()),
                              ButtonFeature(
                                  feature: "สมัคร\nกิจกรรม\n",
                                  image: 'assets/addactivity.png',pages: AllActivity()),
                              ButtonFeature(
                                  feature: "รางวัล\nของฉัน\n",
                                  image: 'assets/myreward.png',pages: MyReward()),
                              ButtonFeature(feature: "คำถาม\nสุขภาพใจ\nรายวัน",
                                  image: 'assets/diaryquestion.png',pages : DiaryQuestion()),
                              ButtonFeature(
                                  feature: "คำถาม\nสุขภาพใจ\nประจำปี",
                                  image: 'assets/yearquestion.png',pages: YearQuestion()),
                              ButtonFeature(
                                  feature: "ประเมิน\n360 องศา\n",
                                  image: 'assets/360.png',pages: Evaluate()),
                              ButtonFeature(feature: "โค้ชชิ่ง\n\n",
                                  image: 'assets/coaching.png',pages: MyReward()),
                              ButtonFeature(feature: "Manager\n\n",
                                  image: 'assets/manager.png',pages: MyReward()),
                              ButtonFeature(feature: "Admin\n\n",
                                  image: 'assets/admin.png',pages: MyReward()),
                              // Column(
                              //   children: [
                              //     Container(
                              //       margin: EdgeInsets.only(
                              //         left:
                              //         MediaQuery
                              //             .of(context)
                              //             .devicePixelRatio * 5,
                              //         top:
                              //         MediaQuery
                              //             .of(context)
                              //             .devicePixelRatio * 5,
                              //       ),
                              //       height: MediaQuery
                              //           .of(context)
                              //           .size
                              //           .height * 0.08,
                              //       width: MediaQuery
                              //           .of(context)
                              //           .size
                              //           .width * 0.17,
                              //       decoration: BoxDecoration(
                              //         borderRadius:
                              //         BorderRadius.all(Radius.circular(100)),
                              //       ),
                              //     ),
                              //     Container(
                              //       margin: EdgeInsets.only(
                              //         left:
                              //         MediaQuery
                              //             .of(context)
                              //             .devicePixelRatio * 5,
                              //         top:
                              //         MediaQuery
                              //             .of(context)
                              //             .devicePixelRatio * 2,
                              //       ),
                              //       child: Text(
                              //         "\n\n\n",
                              //         textAlign: TextAlign.center,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery
                            .of(context)
                            .devicePixelRatio * 8,
                        right: MediaQuery
                            .of(context)
                            .devicePixelRatio * 5,
                        top: MediaQuery
                            .of(context)
                            .devicePixelRatio * 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "กิจกรรมที่น่าสนใจ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AllActivity()),
                              );
                            },
                            child: Text(
                              "ดูทั้งหมด",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomepageActivity(
                              image: 'assets/pikachu.jpg',
                              title: "บ้านปลา SCG เคมีคอลส์",
                              status: 'open',
                          ),
                          HomepageActivity(
                            image: 'assets/pikachu.jpg',
                            title: "บ้านปลา SCG เคมีคอลส์",
                            status: 'open',
                          ),
                          HomepageActivity(
                            image: 'assets/pikachu.jpg',
                            title: "บ้านปลา SCG เคมีคอลส์",
                            status: 'open',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery
                            .of(context)
                            .devicePixelRatio * 8,
                        right: MediaQuery
                            .of(context)
                            .devicePixelRatio * 5,
                        top: MediaQuery
                            .of(context)
                            .devicePixelRatio * 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "รางวัลที่น่าสนใจ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context)=> AllReward())
                              );
                            },
                            child: const Text(
                              "ดูทั้งหมด",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<HomepageBloc, HomepageState>(
                        builder: (context, state){
                          if(state is RewardLoadingState){
                            return Text('');
                          }else if(state is RewardLoadedState){
                            listreward = state.listReward;
                            return LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints){
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height*0.325,
                                    child: ListView.builder(
                                      itemCount: listreward.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return HomepageReward(
                                          homepageBloc: _homepageBloc,
                                          idreward: listreward[index].idReward ?? 0,
                                          name: listreward[index].name ?? "",
                                          endDate: listreward[index].endDate ?? "",
                                          image: listreward[index].image ?? "",
                                          quantity: listreward[index].quantity ?? 0,
                                        );
                                      },
                                    ),
                                  );
                                }
                            );
                          }else{
                            return Text(state.props.toString());
                          }
                        }
                    ),
                    // const SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       HomepageReward(
                    //           title: "หม้อทอดไร้น้ำมัน",
                    //           image: "assets/air_fryer.png",
                    //           quantity: 9),
                    //       HomepageReward(
                    //           title: "หม้อทอดไร้น้ำมัน",
                    //           image: "assets/air_fryer.png",
                    //           quantity: 9),
                    //       HomepageReward(
                    //           title: "อะไรก็ได้",
                    //           image: "assets/pikachu.jpg",
                    //           quantity: 9),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildFeature(BuildContext context, String title, page) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 5,
              top: MediaQuery.of(context).devicePixelRatio * 3,
            ),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffFCDDDD),
                    Color(0xffFEA1C3),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).devicePixelRatio * 5,
              top: MediaQuery.of(context).devicePixelRatio * 2,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
