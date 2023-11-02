import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:unihr/core/feature/profile/user/domain/entity/profile_entity.dart';
import 'package:unihr/feature/pocket/data/model/pocket_model.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_state.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'dart:math' as math;

import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../widget/cardcoin.dart';


class Pocket extends StatefulWidget {
  final List<PocketEntity> coin;
  Pocket({Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
int _currentIndex = 0;
late ProfileProvider profileProvider;
final PocketBloc _pocketBloc = PocketBloc();
late List<Widget> cardList = [];


@override
void initState(){
  List<PocketEntity> listcoin = widget.coin;
  if(listcoin.isNotEmpty) {
    cardList = [
      CardHeart(coinHeart: listcoin[0].amount),
      Coin_SCGC(coinSCGC: listcoin[1].amount),
      Coin_Unicorn(coinUnicorn: listcoin[3].amount),
      Coin_Pony(coinPony: listcoin[2].amount),
      Coin_Fast(coinFast: listcoin[9].amount),
      Coin_DoIt(coinDoIt: listcoin[7].amount),
      Coin_Caring(coinCaring: listcoin[6].amount),
      Coin_Centaur(coinCentaur: listcoin[4].amount),
      Coin_CSR(coinCSR: listcoin[5].amount),
      Coin_obsession(coinObsession: listcoin[8].amount),
      Coin_Outperform(coinOutperform: listcoin[10].amount),
    ];
  }
  else if (listcoin.isEmpty){
    cardList = [
      CardHeart(coinHeart: 0),
      Coin_SCGC(coinSCGC: 0),
      Coin_Unicorn(coinUnicorn: 0),
      Coin_Pony(coinPony: 0),
      Coin_Fast(coinFast: 0),
      Coin_DoIt(coinDoIt: 0),
      Coin_Caring(coinCaring: 0),
      Coin_Centaur(coinCentaur: 0),
      Coin_CSR(coinCSR: 0),
      Coin_obsession(coinObsession: 0),
      Coin_Outperform(coinOutperform: 0),
    ];
  }
  profileProvider = ProfileProvider.of(context, listen: false);

  super.initState();
}

bool _isDisposed = false;

@override
void dispose(){
  super.dispose();
  _pocketBloc.close();
  _isDisposed = true;
}

List<T> map<T>(List list, Function handler){
  List<T> result = [];
  for(var i = 0; i < list.length; i++){
    result.add(handler(i, list[i]));
  }
  return result;
}

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _pocketBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                          'assets/sack_coin.png',
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
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                "${profileProvider.profileData.firstName??"ไม่ระบุ"}" +
                                    " " +
                                    "${profileProvider.profileData.lastName??"ไม่ระบุ"}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
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
                        'กระเป๋าเหรียญ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*0.5,
                    onPageChanged: (index,reason){
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card){
                    return Builder(
                        builder: (BuildContext context){
                          return Container(
                            height: MediaQuery.of(context).size.height*0.5,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*5,
                                right: MediaQuery.of(context).devicePixelRatio*5,
                                bottom: MediaQuery.of(context).devicePixelRatio*10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              elevation: 10,
                              child: card,
                            ),
                          );
                        },
                    );
                  }).toList(),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*5,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.03,
                        height: MediaQuery.of(context).size.width*0.03,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Color(0xffF4BFCF) : Color(0xfff5f5f5),
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}