import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:unihr/feature/pocket/data/model/pocket_model.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';
import 'dart:math' as math;

import '../widget/cardcoin.dart';


class Pocket extends StatefulWidget {
  final List<PocketModel> listCoin;
  Pocket({Key? key,
    required this.listCoin,
  }) : super(key: key);

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
int _currentIndex = 0;
final PocketBloc _pocketBloc = PocketBloc();
List<Widget> cardList = [];

@override
void initState(){
  // _pocketBloc.add(GetPocket());
  if(widget.listCoin.isNotEmpty) {
    cardList = [
      CardHeart(coinHeart: widget.listCoin[0].heart),
      Coin_SCGC(coinSCGC: widget.listCoin[0].coin),
      Coin_Unicorn(coinUnicorn: widget.listCoin[0].unicorn),
      Coin_Pony(coinPony: widget.listCoin[0].pony),
      Coin_Fast(coinFast: widget.listCoin[0].fastmove),
      Coin_DoIt(coinDoIt: widget.listCoin[0].doit),
      Coin_Caring(coinCaring: widget.listCoin[0].caring),
      Coin_Centaur(coinCentaur: widget.listCoin[0].centaur),
      Coin_CSR(coinCSR: widget.listCoin[0].csr),
      Coin_obsession(coinObsession: widget.listCoin[0].obsession),
      Coin_Outperform(coinOutperform: widget.listCoin[0].outperform),
    ];
  }
    super.initState();
}

bool _isDisposed = false;

@override
void dispose(){
  super.dispose();
  _pocketBloc.close();
  _isDisposed = true;
}

// cardList=[
//   CardHeart(coinHeart: listCoin[0].heart),
//   Coin_SCGC(coinSCGC: widget.scgc),
//   Coin_Unicorn(coinUnicorn: widget.unicorn),
//   Coin_Pony(coinPony: widget.pony),
//   Coin_Fast(coinFast: widget.fast,),
//   Coin_DoIt(coinDoIt: widget.doit),
//   Coin_Caring(coinCaring: widget.caring,),
//   Coin_Centaur(coinCentaur: widget.centaur,),
//   Coin_CSR(coinCSR: widget.csr,),
//   Coin_obsession(coinObsession: widget.obsession,),
//   Coin_Outperform(coinOutperform: widget.obsession,),
// ];
List<T> map<T>(List list, Function handler){
  List<T> result = [];
  for(var i = 0; i < list.length; i++){
    result.add(handler(i, list[i]));
  }
  return result;
}

  @override
  Widget build(BuildContext context) {
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
                                        widget.listCoin[0].coin.toString(),
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
                                        widget.listCoin[0].heart.toString(),
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