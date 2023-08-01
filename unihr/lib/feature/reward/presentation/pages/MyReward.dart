import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_bloc.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_event.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_state.dart';

import '../../data/model/myreward_model.dart';
import '../widget/cardMyReward.dart';
import '../widget/shimmer_myreward.dart';

class MyReward extends StatefulWidget {
  const MyReward({Key? key}) : super(key: key);

  @override
  State<MyReward> createState() => _MyRewardState();
}

class _MyRewardState extends State<MyReward> {
  final RewardBloc _rewardBloc = RewardBloc();
  late List<MyRewardModel> listmyreward;

  @override
  void initState(){
    _rewardBloc.add(GetMyReward());
    super.initState();
  }

  bool _isDisposed = false ;

  @override
  void dispose(){
    super.dispose();
    _rewardBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _rewardBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.3,
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
                      child: Image.asset(
                          'assets/trophy.png',
                        width: MediaQuery.of(context).size.width*0.4,
                        fit: BoxFit.cover,
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
                          'รางวัลของฉัน',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio*8,
                        top: MediaQuery.of(context).devicePixelRatio*50,
                        right: MediaQuery.of(context).devicePixelRatio*8,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: const Text("ทั้งหมด",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: const Text("รอตรวจสอบ",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: const Text("สำเร็จ",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: const Text("รับของรางวัลแล้ว",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: const Text("ไม่สำเร็จ",
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
                BlocBuilder<RewardBloc, RewardState>(
                    builder: (context, state){
                      if(state is MyRewardLoadingState){
                        return ShimmerMyReward();
                      }else if (state is MyRewardLoadedState){
                        listmyreward = state.listReward;
                        return LayoutBuilder(
                            builder: (BuildContext context,
                            BoxConstraints constraints) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount: listmyreward.length,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return Padding(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).devicePixelRatio*7,
                                      ),
                                      child: CardMyReward(
                                          rewardBloc: _rewardBloc,
                                          idRedeem:
                                          listmyreward[index].idRedeem??0,
                                          redeemDate: listmyreward[index].redeemDate??DateTime.now().toString(),
                                          redeemStatus: listmyreward[index].redeemStatus??0,
                                          receivedDate: listmyreward[index].receivedDate??DateTime.now().toString(),
                                          idreward: listmyreward[index].idReward??0,
                                          name: listmyreward[index].name??"",
                                          detail: listmyreward[index].detail??"",
                                          image: listmyreward[index].image??""
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