import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';
import 'package:unihr/feature/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:unihr/feature/dashboard/presentation/bloc/dashboard_event.dart';


import '../../../../injection_container.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();

}

class _DashBoardState extends State<DashBoard> {
  final DashboardBloc _dashboardBloc = DashboardBloc();
  late List<DashboardModel> listdashboard;
  int current = 0;
  int progress = 0;

  List<String> items = [
    "MOUNTHLY",
    "5Q COMPARISON",
  ];

  @override
  void initState() {
    _dashboardBloc.add(GetDashBoard());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    _dashboardBloc.close();
    super.dispose();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.24,
                    width: MediaQuery.of(context).size.width*1,
                    child: Image.asset(
                      'assets/pop_up.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.24,
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
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height*0.04,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.02,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*22,
                        // left: MediaQuery.of(context).devicePixelRatio*10
                    ),
                    child: Center(
                      child: Text(
                        "Morale Dashboard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.83,
                  child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio* 5,
                          ),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                current = index;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              height: MediaQuery.of(context).size.height*0.05,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff757575).withOpacity(0.3),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                gradient: current == index ? LinearGradient(
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
                                ) : null,
                              ),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).devicePixelRatio*10,
                ),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.68,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xff757575).withOpacity(0.3),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffFCDDDD),
                          Color(0xffFEA1C3).withOpacity(0.7),
                        ],
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*6,
                            left: MediaQuery.of(context).devicePixelRatio*8,
                          ),
                          child: Text(
                              "สรุปผลประเมิน",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*2,
                                left: MediaQuery.of(context).devicePixelRatio*8,
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.24,
                                  height: MediaQuery.of(context).size.height*0.034,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio*2,
                                left: MediaQuery.of(context).devicePixelRatio*8,
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.034,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*2,
                            left: MediaQuery.of(context).devicePixelRatio*8,
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.24,
                              height: MediaQuery.of(context).size.height*0.034,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*5
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                    "November 2022",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Total score : 68%",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio*12,
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.32,
                            width: MediaQuery.of(context).size.width*0.72,
                            child: Image.asset(
                              "assets/unicorn.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio * 12
                          ),
                          child: Text(
                            "ผู้เข้าร่วมแบบประเมิน",
                            style: TextStyle(
                              fontSize: 20,
                              color : Colors.black
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*3.2,
                            left: MediaQuery.of(context).devicePixelRatio*8,
                          ),
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.75,
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 900,
                            percent: 0.8,
                            linearGradient: LinearGradient(
                              end: Alignment.centerRight,
                              begin: Alignment.centerLeft,
                              colors: [
                                Color(0xffF04E75),
                                Color(0xffFBA77B),
                              ],
                            ),
                            barRadius: Radius.circular(16),
                          ),
                        ),
                      ],
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
