import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unihr/core/feature/profile/user/domain/entity/profile_entity.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_bloc.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_event.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_state.dart';
import 'package:unihr/feature/heart/presentation/page/heart_transfer.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_event.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_state.dart';
import 'package:unihr/feature/pocket/presentation/bloc/heart_year_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/heart_year_event.dart';
import 'package:unihr/feature/pocket/presentation/bloc/heart_year_state.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_state.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_bloc.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_event.dart';
import 'package:unihr/feature/unicalture/presentation/pages/bottomnav/BottomNavigate.dart';
import 'package:unihr/feature/unicalture/presentation/pages/poll/Poll.dart';
import 'package:unihr/feature/unicalture/presentation/pages/score/Score.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardActivity.dart';
import 'package:unihr/feature/homepage/presentation/widget/cardReward.dart';
import '../../../../core/feature/nothing/not_ready_page.dart';
import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../../../../injection_container.dart';
import '../../../activity/presentation/pages/MyActivity.dart';
import '../../../communicate/presentation/page/Communicate.dart';
import '../../../feedback/presentation/pages/feedBack.dart';
import '../../../pocket/data/model/heart_receive_year_model.dart';
import '../../../pocket/data/model/pocket_model.dart';
import '../../../reward/data/model/redeem_reward_model.dart';
import '../../../reward/presentation/bloc/reward_state.dart';
import '../../../threesixty/presentation/pages/EvaluateThreeSixty.dart';
import '../../../question/presentation/pages/YearQuestionDetail.dart';
import '../../../question/presentation/pages/morale_year.dart';
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
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageBloc _homepageBloc = HomepageBloc();
  final PocketBloc _pocketBloc = PocketBloc();
  final ActivityBloc _activityBloc = sl<ActivityBloc>();
  final HeartYearBloc _heartYearBloc = HeartYearBloc();
  final RewardBloc _rewardBloc = RewardBloc();
  late ProfileProvider profileProvider;
  late List<RedeemRewardModel> listredeem;
  late List<AllActivityModel> listactivity;
  late List<PocketEntity> listcoin = [];
  late List<HeartYearModel> listheartyear;

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });


    _activityBloc.add(GetCardActivityHomePage());
    _homepageBloc.add(HomepageLoad());
    _pocketBloc.add(GetPocket());
    _rewardBloc.add(GetRedeemRewardHomePage());
    _heartYearBloc.add(GetHeartYear());
    profileProvider = ProfileProvider.of(context, listen: false);
    listcoin = profileProvider.profileData.wallet??[];
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _activityBloc.close();
    _homepageBloc.close();
    _rewardBloc.close();
    _pocketBloc.close();
    _heartYearBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return ResponsiveApp(builder: (context) {
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
              BlocProvider<ActivityBloc>(
                create: (_) => _activityBloc,
              ),
              BlocProvider<RewardBloc>(
                create: (_) => _rewardBloc,
              ),
              BlocProvider<HeartYearBloc>(
                create: (_) => _heartYearBloc,
              ),
            ],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/top_bar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.0),
                              // Start color with opacity
                              Colors.white.withOpacity(1),
                              // End color with opacity
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Image.asset(
                                "assets/Unicorn.gif",
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 20,
                          left: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        child: BlocBuilder<HomepageBloc, HomepageState>(
                          builder: (context, state) {
                            if (state is HomepageLoadingState) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "สวัสดี,",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            }  else if(state is HomepageLoadedState){
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "สวัสดี,",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${profileProvider.profileData.firstName??"ไม่ระบุ"}" +
                                          " " +
                                          "${profileProvider.profileData.lastName??"ไม่ระบุ"}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            }else {
                              return Text(state.props.toString());
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 50,
                          left: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        child: BlocBuilder<PocketBloc, PocketState>(
                          builder: (context, state) {
                            if (state is PocketLoadingState) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                            )
                                          ],
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    7,
                                                top: MediaQuery.of(context)
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
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    25,
                                                top: MediaQuery.of(context)
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
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2.5,
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    15,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Color(0xFFFFC355),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      2,
                                                  top: MediaQuery.of(context)
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
                                          top: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              15,
                                          left: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              30,
                                        ),
                                        child: Image.asset("assets/gold.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else if (state is PocketLoadedState) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                            )
                                          ],
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    7,
                                                top: MediaQuery.of(context)
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
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    25,
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2,
                                              ),
                                              child: Text(
                                                // listcoin![1].amount.toString()??"",
                                                profileProvider.profileData
                                                    .wallet![1].amount
                                                    .toString()??"-",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2.5,
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    15,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Color(0xFFFFC355),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      2,
                                                  top: MediaQuery.of(context)
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
                                          top: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              15,
                                          left: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              30,
                                        ),
                                        child: Image.asset("assets/gold.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Text(state.props.toString());
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 40,
                          left: MediaQuery.of(context).devicePixelRatio * 50,
                        ),
                        child: BlocBuilder<HeartYearBloc, HeartYearState>(
                          builder: (context, state) {
                            if (state is HeartYearLoadingState) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              9,
                                          vertical: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                            )
                                          ],
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    17,
                                                top: MediaQuery.of(context)
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
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    25,
                                                top: MediaQuery.of(context)
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
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2.5,
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    15,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Color(0xFFEC6C8B),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      2,
                                                  top: MediaQuery.of(context)
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
                                          top: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              24,
                                          left: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              38,
                                        ),
                                        child:
                                            Image.asset("assets/holdheart.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else if (state is HeartYearLoadedState) {
                              listheartyear = state.listheartyear;
                              List<HeartYearModel> listHeartYear =
                                  listheartyear;
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              9,
                                          vertical: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                            )
                                          ],
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    17,
                                                top: MediaQuery.of(context)
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
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    25,
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2,
                                              ),
                                              child: Text(
                                                listheartyear[0]
                                                    .heartReceiveYear
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    2.5,
                                                right: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    15,
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.022,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Color(0xFFEC6C8B),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      2,
                                                  top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      0.5,
                                                ),
                                                child: Text(
                                                  "ส่งหัวใจ(" +
                                                      listheartyear[0]
                                                          .heartReceiveYear
                                                          .toString() +
                                                      "/10)",
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
                                          top: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              24,
                                          left: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              38,
                                        ),
                                        child:
                                            Image.asset("assets/holdheart.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
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
                            ButtonFeature(
                                feature: "กระเป๋า\nเหรียญ",
                                image: 'assets/pocket.png',
                                pages: Pocket(
                                  coin: listcoin,
                                )),
                            ButtonFeature(
                                feature: "รับส่ง\nหัวใจ",
                                image: 'assets/sentHeart.png',
                                pages: HeartTransfer()),
                            ButtonFeature(
                                feature: "ฟีดแบค\n",
                                image: 'assets/feedback.png',
                                pages: FeedBack()),
                            ButtonFeature(
                                feature: "แลกของ\nรางวัล",
                                image: 'assets/reward.png',
                                pages: AllReward()),
                            ButtonFeature(
                                feature: "ภาระกิจ\nของฉัน",
                                image: 'assets/mission.png',
                                pages: MyMission()),
                            ButtonFeature(
                                feature: "การสื่อสาร\n",
                                image: 'assets/commuIcon.png',
                                pages: Communicate()),
                            ButtonFeature(
                                feature: "ตาราง\nคะแนน",
                                image: 'assets/score.png',
                                pages: ScorePage()),
                            ButtonFeature(
                                feature: "ผลโหวต\n",
                                image: 'assets/pollicon.png',
                                pages: PollPage()),
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
                            ButtonFeature(
                                feature: "คำถาม\nสุขภาพใจ\nรายวัน",
                                image: 'assets/diaryquestion.png',
                                pages: DiaryQuestion()),
                            ButtonFeature(
                                feature: "คำถาม\nสุขภาพใจ\nประจำปี",
                                image: 'assets/yearquestion.png',
                                pages: Morale_Year()),
                            ButtonFeature(
                                feature: "ประเมิน\n360 องศา\n",
                                image: 'assets/360.png',
                                pages: Evaluate()),
                            ButtonFeature(
                                feature: "Manager\n\n",
                                image: 'assets/manager.png',
                                pages: NotReady()),
                            ButtonFeature(
                                feature: "Admin\n\n",
                                image: 'assets/admin.png',
                                pages: NotReady()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio * 8,
                      right: MediaQuery.of(context).devicePixelRatio * 5,
                      top: MediaQuery.of(context).devicePixelRatio * 8,
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
                  BlocBuilder<ActivityBloc, ActivityState>(
                      builder: (context, state) {
                    if (state is HomePageActivityLoadingState) {
                      return Text('');
                    } else if (state is HomePageActivityLoadedState) {
                      listactivity = state.listhomepageactivity;
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        if (listactivity.length == 0) {
                          return SizedBox(
                            height: listactivity.length == 0
                                ? MediaQuery.of(context).size.height * 0.05
                                : MediaQuery.of(context).size.height * 0.325,
                          );
                        } else {
                          return SizedBox(
                            height: listactivity.length == 0
                                ? MediaQuery.of(context).size.height * 0.05
                                : MediaQuery.of(context).size.height * 0.325,
                            child: ListView.builder(
                              itemCount: listactivity.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return HomepageActivity(
                                  idActivity:
                                      listactivity[index].idActivity ?? 0,
                                  name: listactivity[index].name ?? "",
                                  detail: listactivity[index].detail ?? "",
                                  location: listactivity[index].location ?? "",
                                  startDate:
                                      listactivity[index].startDate ?? "",
                                  endDate: listactivity[index].endDate ?? "",
                                  openRegisDate:
                                      listactivity[index].openRegisterDate ??
                                          "",
                                  closeRegisDate:
                                      listactivity[index].closeRegisterDate ??
                                          "",
                                  organizer:
                                      listactivity[index].organizer ?? "",
                                  contact: listactivity[index].contact ?? "",
                                  image: listactivity[index].image ?? "",
                                  idActivityStatus:
                                      listactivity[index].idActivityStatus ?? 0,
                                  status: listactivity[index].status ?? "",
                                  idEmployee:
                                      listactivity[index].idEmployee ?? 0,
                                  participantStatus:
                                      listactivity[index].participantStatus ??
                                          0,
                                );
                              },
                            ),
                          );
                        }
                      });
                    } else {
                      return Text(state.props.toString());
                    }
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio * 8,
                      right: MediaQuery.of(context).devicePixelRatio * 5,
                      top: MediaQuery.of(context).devicePixelRatio * 5,
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AllReward()));
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
                  BlocBuilder<RewardBloc, RewardState>(
                      builder: (context, state) {
                    if (state is RedeemRewardHomePageLoadingState) {
                      return Text('');
                    } else if (state is RedeemRewardHomePageLoadedState) {
                      listredeem = state.listRedeem;
                      return LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        if (listredeem.length == 0) {
                          return SizedBox(
                            height: listredeem.length == 0
                                ? MediaQuery.of(context).size.height * 0.05
                                : MediaQuery.of(context).size.height * 0.325,
                          );
                        } else {
                          return SizedBox(
                            height: listredeem.length == 0
                                ? MediaQuery.of(context).size.height * 0.05
                                : MediaQuery.of(context).size.height * 0.325,
                            child: ListView.builder(
                              itemCount: listredeem.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return HomepageReward(
                                    idCompanyReward: listredeem[index].idCompanyReward??0,
                                    name: listredeem[index].name??"",
                                    detail: listredeem[index].detail??"",
                                    image: listredeem[index].image??"",
                                    rewardManager: listredeem[index].rewardManager??"",
                                    contact: listredeem[index].contact??"",
                                    idRewardType: listredeem[index].idRewardType??0,
                                    items: listredeem[index].items??[],
                                    images: listredeem[index].images??[],
                                    options: listredeem[index].options??[],
                                    idUniReward: listredeem[index].idUniReward??0
                                );
                              },
                            ),
                          );
                        }
                      });
                    } else {
                      return Text(state.props.toString());
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
