import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_event.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_state.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_state.dart';
import 'package:unihr/feature/unicalture/presentation/pages/bottomnav/BottomNavigate.dart';
import 'package:unihr/feature/unicalture/presentation/pages/poll/Poll.dart';
import 'package:unihr/feature/unicalture/presentation/pages/score/Score.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardActivity.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardReward.dart';
import '../../../activity/presentation/pages/MyActivity.dart';
import '../../../communicate/presentation/page/Communicate.dart';
import '../../../feedback/presentation/pages/feedBack.dart';
import '../../../heart/presentation/page/SentHeart.dart';
import '../../../pocket/data/model/pocket_model.dart';
import '../../../question/presentation/pages/EvaluateThreeSixty.dart';
import '../../../question/presentation/pages/YearQuestion.dart';
import '../../../reward/presentation/pages/redeem_reward.dart';
import '../../data/model/activity_model.dart';
import '../../data/model/reward_model.dart';
import '../widget/buttonNav.dart';
import '../../../activity/presentation/pages/AllActivity.dart';
import '../../../reward/presentation/pages/MyReward.dart';
import '../../../question/presentation/pages/DiaryQuestion.dart';
import '../../../pocket/presentation/pages/Pocket.dart';
import '../../../mission/presentation/pages/MyMission.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final HomepageBloc _homepageBloc = HomepageBloc();
  final PocketBloc _pocketBloc = PocketBloc();
  late List<RewardModel> listreward;
  late List<ActivityModel> listactivity;
  late List<PocketModel> listcoin = [];

  @override
  void initState() {
    listcoin =[];
    _homepageBloc.add(GetCard());
    _pocketBloc.add(GetPocket());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _homepageBloc.close();
    _pocketBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<HomepageBloc>(
                  create: (_) => _homepageBloc,
                ),
                BlocProvider<PocketBloc>(
                  create: (_) => _pocketBloc,
                ),
              ],
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
                          child: BlocBuilder<PocketBloc, PocketState>(
                            builder: (context, state){
                              if(state is PocketLoadingState){
                                return Row(
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
                                                  "-",
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
                                                  "-",
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
                                                    "ส่งหัวใจ(-/10)",
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
                                );
                              }else if (state is PocketLoadedState){
                                listcoin = state.listcoin;
                                return Row(
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
                                                child: Text(
                                                  listcoin[0].coin.toString(),
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
                                                child: Text(
                                                  listcoin[0].heart.toString(),
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
                                                    "ส่งหัวใจ("+
                                                        listcoin[0].heart.toString()
                                                        +"/10)",
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
                                );
                              }else{
                                return Text(state.props.toString());
                              }
                            },
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
                                  image: 'assets/pocket.png',pages: Pocket(
                                    listcoin: listcoin,)),
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
                                  image: 'assets/myactivity.png',
                                  pages: MyActivity()),
                              ButtonFeature(
                                  feature: "สมัคร\nกิจกรรม\n",
                                  image: 'assets/addactivity.png',
                                  pages: AllActivity()),
                              ButtonFeature(
                                  feature: "รางวัล\nของฉัน\n",
                                  image: 'assets/myreward.png',
                                  pages: MyReward()),
                              ButtonFeature(feature: "คำถาม\nสุขภาพใจ\nรายวัน",
                                  image: 'assets/diaryquestion.png',
                                  pages : DiaryQuestion()),
                              ButtonFeature(
                                  feature: "คำถาม\nสุขภาพใจ\nประจำปี",
                                  image: 'assets/yearquestion.png',
                                  pages: YearQuestion()),
                              ButtonFeature(
                                  feature: "ประเมิน\n360 องศา\n",
                                  image: 'assets/360.png',
                                  pages: Evaluate()),
                              ButtonFeature(feature: "โค้ชชิ่ง\n\n",
                                  image: 'assets/coaching.png',
                                  pages: MyReward()),
                              ButtonFeature(feature: "Manager\n\n",
                                  image: 'assets/manager.png',
                                  pages: MyReward()),
                              ButtonFeature(feature: "Admin\n\n",
                                  image: 'assets/admin.png',
                                  pages: MyReward()),
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
                            .devicePixelRatio * 8,
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
                    BlocBuilder<HomepageBloc, HomepageState>(
                        builder: (context, state){
                          if(state is RewardLoadingState){
                            return Text('');
                          }else if(state is GetCardLoadedState){
                            listactivity = state.listactivity;
                            return LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints){
                                  return SizedBox(
                                    height: listactivity.length == 0 ? MediaQuery.of(context)
                                        .size.height*0.05 : MediaQuery.of(context)
                                        .size.height*0.325,
                                    child: ListView.builder(
                                      itemCount: listactivity.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return HomepageActivity(
                                          idActivity: listactivity[index]
                                              .idActivity ?? 0,
                                          name: listactivity[index]
                                              .name ?? "",
                                          detail: listactivity[index]
                                              .detail ?? "",
                                          location: listactivity[index]
                                              .location ?? "",
                                          startDate: listactivity[index]
                                              .startDate ?? "",
                                          endDate: listactivity[index]
                                              .endDate ?? "",
                                          openRegisDate: listactivity[index]
                                              .openRegisterDate ?? "",
                                          closeRegisDate: listactivity[index]
                                              .closeRegisterDate ?? "",
                                          organizer: listactivity[index]
                                              .organizer ?? "",
                                          contact: listactivity[index]
                                              .contact ?? "",
                                          image: listactivity[index]
                                              .image ?? "",
                                          idActivityStatus: listactivity[index]
                                              .idActivityStatus ?? 0,
                                          status: listactivity[index]
                                              .status ?? "",
                                          idEmployee: listactivity[index]
                                              .idEmployee ?? 0,
                                          participantStatus: listactivity[index]
                                              .participantStatus ?? 0,
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
                          }else if(state is GetCardLoadedState){
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
                                          detail: listreward[index].detail ?? "",
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
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
