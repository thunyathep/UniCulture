import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/feedback/presentation/widget/buttonFeedback.dart';
import 'package:unihr/feature/feedback/data/model/feedback_model.dart';
import 'package:unihr/feature/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';

import 'dart:math' as math;

import '../../../../injection_container.dart';
import '../widget/listFeedback.dart';
import '../widget/shimmerlist.dart';
import '../bloc/feedback_event.dart';
import '../bloc/feedback_state.dart';
import 'AddFeedBack.dart';
import 'SearchFeedBack.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();

}

class _FeedBackState extends State<FeedBack> {
  final FeedbackBloc _feedbackBloc = sl<FeedbackBloc>();
  late List<FeedbackModel> listfeedback;
  int current = 0;

  List<String> items = [
    "ฟีดแบคที่ได้รับ",
    "ฟีดแบคที่ส่ง",
  ];

  @override
  void initState() {
    _feedbackBloc.add(GetFeedback(current));
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _feedbackBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _feedbackBloc,
          child: RefreshIndicator(
            onRefresh: () async => _feedbackBloc.add(GetFeedback(current)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.3,
                        width: MediaQuery.of(context).size.width*1,
                        child: Image.asset(
                          'assets/top_bar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.3,
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
                          angle: 2 * math.pi/180,
                          child: Image.asset(
                            'assets/handfeedback.png',
                            width: MediaQuery.of(context).size.width*0.5,
                            height: MediaQuery.of(context).size.height*0.27,
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
                          top: MediaQuery.of(context).devicePixelRatio*50,
                          left: MediaQuery.of(context).devicePixelRatio*10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'ฟีดแบค',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff5B4589), //<-- SEE HERE
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context)=>AddFeedBack()),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*2,
                                    right: MediaQuery.of(context).devicePixelRatio*5,
                                  ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xff5B4589), //<-- SEE HERE
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>SearchFeedBack()),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                                  _feedbackBloc.add(GetFeedback(current));
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
                  BlocBuilder<FeedbackBloc, FeedbackState>(
                      builder: (context, state){
                        if(state is FeedbackLoadingState){
                          return ShimmerListFeedback();
                        }else if(state is FeedbackLoadedState){
                          listfeedback = state.listFeedback;
                          return LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints){
                              return SizedBox(
                                // height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  itemCount: listfeedback.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListFeedback(
                                      feedbackBloc: _feedbackBloc,
                                      feedbackType: listfeedback[index]
                                            .feedbackType ?? "",
                                      currentpage: current ?? 0,
                                      title: listfeedback[index].feedback ?? "",
                                      firstName:current == 0 ?
                                        listfeedback[index]
                                            .senderFirstname ?? "" :
                                        listfeedback[index]
                                            .receiverFirstname ?? "",
                                      lastName:current == 0 ?
                                        listfeedback[index]
                                            .senderLastname ?? "" :
                                        listfeedback[index]
                                            .receiverLastname?? "",
                                      date: listfeedback[index].feedbackDate
                                          ?? DateTime.now().toString(),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }else {
                          return Text(state.props.toString());
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
