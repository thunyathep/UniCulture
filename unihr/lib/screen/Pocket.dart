import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;


class Pocket extends StatefulWidget {
  const Pocket({Key? key}) : super(key: key);

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
int _currentIndex = 0;
List cardList=[
  CardHeart(),
  Coin_SCGC(),
  Coin_Unicorn(),
  Coin_Pony(),
  Coin_Fast(),
  Coin_DoIt(),
  Coin_Caring(),
  Coin_Centaur(),
  Coin_CSR(),
  Coin_obsession(),
  Coin_Outperform(),
];
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
                        color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
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
    );
  }
}



class CardHeart extends StatefulWidget {
  const CardHeart({Key? key}) : super(key: key);

  @override
  State<CardHeart> createState() => _CardHeartState();
}

class _CardHeartState extends State<CardHeart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "หัวใจ",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/heart.png",
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_SCGC extends StatefulWidget {
  const Coin_SCGC({Key? key}) : super(key: key);

  @override
  State<Coin_SCGC> createState() => _Coin_SCGCState();
}

class _Coin_SCGCState extends State<Coin_SCGC> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "SCGC",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coin2.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Unicorn extends StatefulWidget {
  const Coin_Unicorn({Key? key}) : super(key: key);

  @override
  State<Coin_Unicorn> createState() => _Coin_UnicornState();
}

class _Coin_UnicornState extends State<Coin_Unicorn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "UNICORN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coin.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Pony extends StatefulWidget {
  const Coin_Pony({Key? key}) : super(key: key);

  @override
  State<Coin_Pony> createState() => _Coin_PonyState();
}

class _Coin_PonyState extends State<Coin_Pony> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "PONY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coinpony.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Fast extends StatefulWidget {
  const Coin_Fast({Key? key}) : super(key: key);

  @override
  State<Coin_Fast> createState() => _Coin_FastState();
}

class _Coin_FastState extends State<Coin_Fast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "FAST MOVE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/Fast_move_coin.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_DoIt extends StatefulWidget {
  const Coin_DoIt({Key? key}) : super(key: key);

  @override
  State<Coin_DoIt> createState() => _Coin_DoItState();
}

class _Coin_DoItState extends State<Coin_DoIt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "DO IT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  "PROFESSIONALLY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Image.asset(
                  "assets/coin_do_it.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Caring extends StatefulWidget {
  const Coin_Caring({Key? key}) : super(key: key);

  @override
  State<Coin_Caring> createState() => _Coin_CaringState();
}

class _Coin_CaringState extends State<Coin_Caring> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "CARING",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coincaring.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Centaur extends StatefulWidget {
  const Coin_Centaur({Key? key}) : super(key: key);

  @override
  State<Coin_Centaur> createState() => _Coin_CentaurState();
}

class _Coin_CentaurState extends State<Coin_Centaur> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "CENTAUR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coincentaur.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_CSR extends StatefulWidget {
  const Coin_CSR({Key? key}) : super(key: key);

  @override
  State<Coin_CSR> createState() => _Coin_CSRState();
}

class _Coin_CSRState extends State<Coin_CSR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "CSR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coincsr.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_obsession extends StatefulWidget {
  const Coin_obsession({Key? key}) : super(key: key);

  @override
  State<Coin_obsession> createState() => _Coin_obsessionState();
}

class _Coin_obsessionState extends State<Coin_obsession> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "OBSESSION",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coinobsession.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coin_Outperform extends StatefulWidget {
  const Coin_Outperform({Key? key}) : super(key: key);

  @override
  State<Coin_Outperform> createState() => _Coin_OutperformState();
}

class _Coin_OutperformState extends State<Coin_Outperform> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/top_bar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*15,
                  ),
                  child: Text(
                    "OUTPERFORM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/coinoutperform.png",
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  fit: BoxFit.contain,
                ),
                Text(
                  "10",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
