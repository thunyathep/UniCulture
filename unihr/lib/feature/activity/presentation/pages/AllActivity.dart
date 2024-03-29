import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_event.dart';
import 'package:unihr/feature/activity/presentation/widget/cardAllActivity.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'dart:math' as math;

import '../../../../injection_container.dart';
import '../bloc/activity_bloc.dart';
import '../bloc/activity_state.dart';
import '../widget/shimmer_cardactivity.dart';



class AllActivity extends StatefulWidget {
  const AllActivity({Key? key}) : super(key: key);

  @override
  State<AllActivity> createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
  final ActivityBloc _activityBloc = sl<ActivityBloc>();
  late List<AllActivityModel> listallactivity;

  @override
  void initState(){
    _activityBloc.add(GetAllActivity());
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
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.25,
                      width: MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0), // Start color with opacity
                            Colors.white.withOpacity(1), // End color with opacity
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Transform.rotate(
                        angle: 5 * math.pi/180,
                        child: Image.asset(
                          'assets/human.png',
                          width: MediaQuery.of(context).size.width*0.45,
                          height: MediaQuery.of(context).size.height*0.23,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height*0.04,
                            ),
                          ),
                          ShowCoin(),
                        ],
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*17,
                          left: MediaQuery.of(context).devicePixelRatio*17
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.18,
                            height: MediaQuery.of(context).size.height*0.08,
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
                                    ]
                                ),
                                width: 4,
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.18,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Image.asset('assets/Unicorn.gif',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio*5,
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
                        top: MediaQuery.of(context).devicePixelRatio*40,
                        left: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: const Text(
                        'กิจกรรมทั้งหมด',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<ActivityBloc, ActivityState>(
                    builder: (context, state){
                      if(state is AllActivityLoadingState){
                        return ShimmerActivity();
                      }else if (state is AllActivityLoadedState){
                        listallactivity = state.listallactivity;
                        return LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount: listallactivity.length,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return Padding(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).devicePixelRatio*7,
                                      ),
                                      child: CardActivity(
                                        activityBloc: _activityBloc,
                                        idActivity: listallactivity[index]
                                            .idActivity ?? 0,
                                        name: listallactivity[index]
                                            .name ?? "",
                                        detail: listallactivity[index]
                                            .detail ?? "",
                                        location: listallactivity[index]
                                            .location ?? "",
                                        startDate: listallactivity[index]
                                            .startDate ?? "",
                                        endDate: listallactivity[index]
                                            .endDate ?? "",
                                        openRegisDate: listallactivity[index]
                                            .openRegisterDate ?? "",
                                        closeRegisDate: listallactivity[index]
                                            .closeRegisterDate ?? "",
                                        organizer: listallactivity[index]
                                            .organizer ?? "",
                                        contact: listallactivity[index]
                                            .contact ?? "",
                                        image: listallactivity[index]
                                            .image ?? "",
                                        idActivityStatus: listallactivity[index]
                                            .idActivityStatus ?? 0,
                                        status: listallactivity[index]
                                            .status ?? "",
                                        idEmployee: listallactivity[index]
                                            .idEmployee ?? 0,
                                        participantStatus: listallactivity[index]
                                            .participantStatus ?? 0,
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
