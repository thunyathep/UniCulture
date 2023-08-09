import 'package:flutter/material.dart';


class CardHeart extends StatefulWidget {
  // final int idEmployee;
  final int? coinHeart;
  const CardHeart({Key? key,
    // required this.idEmployee,
    required this.coinHeart,
  }) : super(key: key);

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
          Container(
            margin: EdgeInsets.all(
              MediaQuery.of(context).devicePixelRatio*5,
            ),
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*1,
            child: Image.asset(
              "assets/framecard.png",
              fit: BoxFit.cover,
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
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*6.5,
                      ),
                      height: MediaQuery.of(context).size.height*0.007,
                      width: MediaQuery.of(context).size.width*0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffFEA1C3),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio*22,
                      ),
                      width: MediaQuery.of(context).size.width*0.12,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffFCDDDD),
                              Color(0xffFEA1C3),
                            ]
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.coinHeart.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
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
    );
  }
}

class Coin_SCGC extends StatefulWidget {
  // final int idEmployee;
  final int? coinSCGC;
  const Coin_SCGC({Key? key,
  //   required this.idEmployee,
    required this.coinSCGC
  }) : super(key: key);

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
                  widget.coinSCGC.toString(),
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
  // final int idEmployee;
  final int? coinUnicorn;
  const Coin_Unicorn({Key? key,
  //   required this.idEmployee,
    required this.coinUnicorn
  }) : super(key: key);

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
                  widget.coinUnicorn.toString(),
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
  // final int idEmployee;
  final int? coinPony;
  const Coin_Pony({Key? key,
  //   required this.idEmployee,
    required this.coinPony,
  }) : super(key: key);

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
                  widget.coinPony.toString(),
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
  // final int idEmployee;
  final int? coinFast;
  const Coin_Fast({Key? key,
  //   required this.idEmployee,
    required this.coinFast,
  }) : super(key: key);

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
                  widget.coinFast.toString(),
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
  // final int idEmployee;
  final int? coinDoIt;
  const Coin_DoIt({Key? key,
    // required this.idEmployee,
    required this.coinDoIt,
  }) : super(key: key);

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
  // final int idEmployee;
  final int? coinCaring;
  const Coin_Caring({Key? key,
    // required this.idEmployee,
    required this.coinCaring,
  }) : super(key: key);

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
  // final int idEmployee;
  final int? coinCentaur;
  const Coin_Centaur({Key? key,
    // required this.idEmployee,
    required this.coinCentaur,
  }) : super(key: key);

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
                  widget.coinCentaur.toString(),
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
  // final int idEmployee;
  final int? coinCSR;
  const Coin_CSR({Key? key,
    // required this.idEmployee,
    required this.coinCSR,
  }) : super(key: key);

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
                  widget.coinCSR.toString(),
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
  // final int idEmployee;
  final int? coinObsession;
  const Coin_obsession({Key? key,
    // required this.idEmployee,
    required this.coinObsession,
  }) : super(key: key);

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
                  widget.coinObsession.toString(),
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
  // final int idEmployee;
  final int? coinOutperform;
  const Coin_Outperform({Key? key,
    // required this.idEmployee,
    required this.coinOutperform,
  }) : super(key: key);

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
                  widget.coinOutperform.toString(),
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