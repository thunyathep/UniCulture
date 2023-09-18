import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/core/feature/profile/user/data/model/all_profile_user_model.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_bloc.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_event.dart';
import 'package:unihr/feature/heart/presentation/page/send_heart.dart';
import 'package:unihr/feature/heart/presentation/widget/listUser.dart';
import 'package:unihr/injection_container.dart';
import 'dart:math' as math;
import '../../../unicalture/presentation/pages/calendar/Calender.dart';
import '../../data/model/heart_model.dart';
import '../bloc/heart_state.dart';
import '../widget/shimmer_list_user.dart';
import 'Search.dart';

class HeartTransfer extends StatefulWidget {
  const HeartTransfer({Key? key}) : super(key: key);

  @override
  State<HeartTransfer> createState() => _HeartTransferState();
}

class _HeartTransferState extends State<HeartTransfer> {
  final HeartBloc _heartBloc = sl<HeartBloc>();
  late List<HeartTransferModel> listheart;

  int current = 0;

  List<String> items = [
    "รับหัวใจ",
    "ส่งหัวใจ",
  ];

  @override
  void initState() {
    listheart = [];
    _heartBloc.add(GetHeart(current));
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _heartBloc.close();
    _isDisposed = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _heartBloc,
          child: RefreshIndicator(
            onRefresh: () async => _heartBloc.add(GetHeart(current)),
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
                            'assets/heartbig.png',
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.23,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*25,
                          left: MediaQuery.of(context).devicePixelRatio*60,
                        ),
                        child: Transform.rotate(
                          angle: 330 * math.pi/180,
                          child: Image.asset(
                            'assets/heartbig.png',
                            width: MediaQuery.of(context).size.width*0.15,
                            height: MediaQuery.of(context).size.height*0.15,
                            fit: BoxFit.contain,
                          ),
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
                          'รับส่งหัวใจ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SendHeart()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*55,
                            left: MediaQuery.of(context).devicePixelRatio*12,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).devicePixelRatio*25,
                                  ),
                                  child: Text(
                                    "ส่งหัวใจเลย!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    'assets/holdheart.png',
                                  width: MediaQuery.of(context).size.width*0.25,
                                  height: MediaQuery.of(context).size.height*0.085,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
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
                            Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              height: MediaQuery.of(context).size.height*0.035,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/coin2.png',
                                        width: MediaQuery.of(context).size.width*0.06,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Text(
                                          '26',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/heart.png',
                                        width: MediaQuery.of(context).size.width*0.06,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).devicePixelRatio*3,
                                        ),
                                        child: Text(
                                          '10',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
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
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.83,
                          child: ListView.builder(
                              itemCount: items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).devicePixelRatio*5,
                                    left: MediaQuery.of(context).devicePixelRatio* 5,
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        current = index;
                                      });
                                      _heartBloc.add(GetHeart(current));
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*5,
                              left: MediaQuery.of(context).devicePixelRatio*15,
                            ),
                            child: Row(
                              children: [
                                Text(
                                    "ค้นหาชื่อ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => Search(),),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*15,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.55,
                                    height: MediaQuery.of(context).size.height*0.035,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      color: Color(0xfff5f5f5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*5,
                              left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                            child: Row(
                              children: [
                                Text(
                                  "ค้นหาวันที่",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context)=>Calendar())
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*13,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.55,
                                    height: MediaQuery.of(context).size.height*0.035,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      color: Color(0xfff5f5f5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MediaQuery.of(context).devicePixelRatio*3,
                                          ),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            size: MediaQuery.of(context).size.width*0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*5,
                              left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                            child: Row(
                              children: [
                                Text(
                                  "จำนวนหัวใจ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            topLeft: Radius.circular(50),
                                          ),
                                        ),
                                        builder: ((context){
                                          return Container(
                                            height: MediaQuery.of(context).size.height*0.35,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*10,
                                                    left: MediaQuery.of(context).devicePixelRatio*10,
                                                  ),
                                                  child: Text(
                                                    "เลือกจำนวนหัวใจ",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Color(0xff5B4589),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){},
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                                    ),
                                                    child: Text(
                                                      "ทั้งหมด",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){},
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*10,
                                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "1",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,

                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){},
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*10,
                                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "2",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){},
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*10,
                                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "3",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,

                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: MediaQuery.of(context).devicePixelRatio*5,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width*0.05,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.55,
                                    height: MediaQuery.of(context).size.height*0.035,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      color: Color(0xfff5f5f5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*10,
                              left: MediaQuery.of(context).devicePixelRatio*15,                          ),
                            child: Text(
                              "รายการการรับหัวใจ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*5,
                              left: MediaQuery.of(context).devicePixelRatio*12,
                            ),
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: BlocBuilder<HeartBloc, HeartState>(
                              builder: (context, state){
                                if(state is HeartLoadingState){
                                  return ShimmerListUser();
                                }else if (state is HeartLoadedState){
                                  listheart = state.listheart;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                      itemCount: listheart.length,
                                      itemBuilder: (BuildContext context, int index){
                                        return ListUser(
                                            heartBloc: _heartBloc,
                                            date: listheart[index]
                                                .transferDate??"",
                                            value: listheart[index].value??0,
                                            firstname: current == 0 ?
                                              listheart[index]
                                                .senderFirstname??"" :
                                              listheart[index]
                                                  .receiverFirstname??"",
                                            lastname: current == 0 ?
                                            listheart[index]
                                                .senderLastname??"" :
                                            listheart[index]
                                                .receiverLastname??"",
                                        );
                                      }
                                  );
                                }else{
                                  return Text(state.props.toString());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
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
