import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';
import 'package:unihr/feature/activity/domain/entity/allactivity_entity.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_bloc.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_event.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_state.dart';
import 'package:unihr/feature/activity/presentation/widget/card_myactivity.dart';
import 'package:unihr/feature/activity/presentation/widget/shimmer_cardactivity.dart';
import 'dart:math' as math;

import '../../../../injection_container.dart';
import '../../../pocket/presentation/widget/show_coin.dart';
import 'DetailMyActivity.dart';

class MyActivity extends StatefulWidget {

  const MyActivity({Key? key}) : super(key: key);

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  final ActivityBloc _activityBloc = sl<ActivityBloc>();
  late List<MyActivityModel> listactivity;

  @override
  void initState(){
    _activityBloc.add(GetMyActivityStatus(0));
    super.initState();
  }

  bool _isDisposed = false ;

  @override
  void dispose(){
    super.dispose();
    _activityBloc.close();
    _isDisposed = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _activityBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(
                        angle: 5 * math.pi / 180,
                        child: Image.asset(
                          'assets/human.png',
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.23,
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
                        top: MediaQuery.of(context).devicePixelRatio * 40,
                        left: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: const Text(
                        'กิจกรรมของฉัน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 8,
                        top: MediaQuery.of(context).devicePixelRatio * 55,
                        right: MediaQuery.of(context).devicePixelRatio * 8,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                _activityBloc.add(GetMyActivityStatus(0));
                              },
                              child: const Text(
                                "ทั้งหมด",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _activityBloc.add(GetMyActivityStatus(2));
                              },
                              child: const Text(
                                "กิจกรรมที่กำลังจะมาถึง",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _activityBloc.add(GetMyActivityStatus(5));
                              },
                              child: const Text(
                                "กิจกรรมที่เสร็จสิ้น",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _activityBloc.add(GetMyActivityStatus(4));
                              },
                              child: const Text(
                                "กิจกรรมที่ยกเลิก",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<ActivityBloc, ActivityState>(
                    builder: (context, state){
                      if(state is MyActivityLoadingState){
                        return ShimmerActivity();
                      }else if (state is MyActivityLoadedState){
                        listactivity = state.listactivity;
                        return LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount: listactivity.length,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return Padding(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).devicePixelRatio*7,
                                      ),
                                      child: CardMyActivity(
                                          activityBloc: _activityBloc,
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
                                          coin: listactivity[index].coin,
                                        specialCoin: listactivity[index].specialCoin,
                                      ),
                                    );
                                  }
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
}