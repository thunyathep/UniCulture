import 'package:flutter/material.dart';


class CheckCoinType extends StatefulWidget {
  final idCoinType;

  CheckCoinType({Key? key,
    required this.idCoinType,
  }) : super(key: key);

  @override
  State<CheckCoinType> createState() => _CheckCoinTypeState();
}

class _CheckCoinTypeState extends State<CheckCoinType> {
  String image = "";

  @override
  Widget build(BuildContext context) {
    if(widget.idCoinType == 1){
      image = 'assets/heart.png';
    }else if(widget.idCoinType == 2){
      image = 'assets/coin2.png';
    }else if(widget.idCoinType == 3){
      image = 'assets/coinpony.png';
    }else if(widget.idCoinType == 4){
      image = 'assets/coin.png';
    }else if(widget.idCoinType == 5){
      image = 'assets/coincentaur.png';
    }else if(widget.idCoinType == 6){
      image = 'assets/coincsr.png';
    }else if(widget.idCoinType == 7){
      image = 'assets/coincaring.png';
    }else if(widget.idCoinType == 8){
      image = 'assets/coin_do_it.png';
    }else if(widget.idCoinType == 9){
      image = 'assets/coinobsession.png';
    }else if(widget.idCoinType == 10){
      image = 'assets/Fast_move_coin.png';
    }else if(widget.idCoinType == 11){
      image = 'assets/coinoutperform.png';
    }
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width * 0.07,
      height: MediaQuery.of(context).size.height * 0.07,
    );
  }
}
