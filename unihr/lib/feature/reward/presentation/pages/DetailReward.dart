import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../domain/entity/redeem_reward_entity.dart';
import '../widget/coinType.dart';

class DetailReward extends StatefulWidget {
  final int idCompanyReward;
  final String name;
  final String detail;
  final String image;
  final String rewardManager;
  final String contact;
  final dynamic location;
  final int idRewardType;
  final List<Item> items;
  final List<Images> images;
  final List<ThreeSixtyModelOption> options;
  final int idUniReward;
  const DetailReward({Key? key,
    required this.idCompanyReward,
    required this.name,
    required this.detail,
    required this.image,
    required this.rewardManager,
    required this.contact,
    this.location,
    required this.idRewardType,
    required this.items,
    required this.images,
    required this.options,
    required this.idUniReward
  }) : super(key: key);

  @override
  State<DetailReward> createState() => _DetailRewardState();
}

class _DetailRewardState extends State<DetailReward> {
  int numberofreward = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: MediaQuery.of(context).size.height*0.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white.withOpacity(0.0), // Start color with opacity
                                Color(0xffE299AA).withOpacity(0.5), // End color with opacity
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.25,
                          color: Colors.transparent,
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: MediaQuery.of(context).size.height*0.1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0.0), // Start color with opacity
                                Color(0xffE299AA).withOpacity(0.7), // End color with opacity
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*20,
                        left: MediaQuery.of(context).devicePixelRatio*5,
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                          size: MediaQuery.of(context).size.width*0.07,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.4,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.8,
                          width: MediaQuery.of(context).size.width*1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                  top: MediaQuery.of(context).devicePixelRatio*8,
                                  bottom: MediaQuery.of(context).devicePixelRatio*2,
                                  right: MediaQuery.of(context).devicePixelRatio*10,
                                ),
                                child: Text(
                                  widget.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).devicePixelRatio*2,
                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                  right: MediaQuery.of(context).devicePixelRatio*10,
                                ),
                                child: Text(
                                  "คงเหลือ : ",
                                  // "คลัง : "+widget.quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff757575),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio*2,
                                  bottom: MediaQuery.of(context).devicePixelRatio*2,
                                  left: MediaQuery.of(context).devicePixelRatio*10,
                                  right: MediaQuery.of(context).devicePixelRatio*10,
                                ),
                                child: Text(
                                  widget.detail,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio*2,
                                  bottom: MediaQuery.of(context).devicePixelRatio*2,
                                ),
                                child: Row(
                                  children: [
                                    widget.items[0].coins!.length == 1
                                        ? Container(
                                      height: MediaQuery.of(context).size.height * 0.03,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CheckCoinType(
                                            idCoinType:
                                            widget.items[0].coins![0].idCoinType,
                                          ),
                                          Text(
                                            " X" +
                                                widget.items[0].coins![0].amount
                                                    .toString(),
                                          ),
                                        ],
                                      ),
                                    )
                                        : Container(
                                      height: MediaQuery.of(context).size.height * 0.03,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CheckCoinType(
                                            idCoinType:
                                            widget.items[0].coins![0].idCoinType,
                                          ),
                                          Text(
                                            " X" +
                                                widget.items[0].coins![0].amount
                                                    .toString(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery.of(context).devicePixelRatio*5,
                                            ),
                                            child: CheckCoinType(
                                              idCoinType:
                                              widget.items[0].coins![1].idCoinType,
                                            ),
                                          ),
                                          Text(
                                            " X" +
                                                widget.items[0].coins![1].amount
                                                    .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).devicePixelRatio*5,
                                        bottom: MediaQuery.of(context).devicePixelRatio*2,
                                        left: MediaQuery.of(context).devicePixelRatio*10,
                                        right: MediaQuery.of(context).devicePixelRatio*10,
                                      ),
                                    child: Text(
                                      "จำนวน",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                      right: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.4,
                                    height: MediaQuery.of(context).size.height*0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                        width: 2.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.125,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                width: 2.5,
                                                color: Color(0xffFCB0C2),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: (){
                                                if(numberofreward > 1){
                                                  setState(() {
                                                    numberofreward =
                                                        numberofreward - 1;
                                                  });
                                                }
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                color: Color(0xffFCB0C2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.125,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          child: Center(
                                            child: Text(
                                              numberofreward.toString(),
                                              style: TextStyle(
                                                color: Color(0xffFCB0C2),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.125,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                width: 2.5,
                                                color: Color(0xffFCB0C2),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  numberofreward =
                                                      numberofreward + 1;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Color(0xffFCB0C2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).devicePixelRatio*2,
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                      right: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    child: Text(
                                      "รวม",
                                      style: TextStyle(
                                        color: Color(0xff757575),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*6,
                                    ),
                                    child: widget.items[0].coins!.length == 1 ?
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CheckCoinType(
                                              idCoinType:
                                              widget.items[0].coins![0].idCoinType,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*3,
                                                right: MediaQuery.of(context).devicePixelRatio*5,
                                              ),
                                              child: Text(
                                                " X" +
                                                  widget.items[0].coins![0].amount
                                                      .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ):Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CheckCoinType(
                                              idCoinType:
                                              widget.items[0].coins![0].idCoinType,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*3,
                                                right: MediaQuery.of(context).devicePixelRatio*5,
                                              ),
                                              child: Text(
                                                " X" +
                                                    widget.items[0].coins![0].amount
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CheckCoinType(
                                              idCoinType:
                                              widget.items[0].coins![1].idCoinType,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context).devicePixelRatio*3,
                                                right: MediaQuery.of(context).devicePixelRatio*5,
                                              ),
                                              child: Text(
                                                " X" +
                                                    widget.items[0].coins![1].amount
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
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
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(20.0)), //this right here
                                            child: Container(
                                              height: MediaQuery.of(context).size.height*0.28,
                                              width: MediaQuery.of(context).size.width*0.8,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*3,
                                                    ),
                                                    child: Text(
                                                      "ยืนยันการแลกของรางวัล",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                                    ),
                                                    child: Text(
                                                      widget.name,
                                                      style: TextStyle(
                                                        color: Color(0xff757575),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                      .size.width * 0.5,
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(context).devicePixelRatio*2,
                                                      bottom: MediaQuery.of(context).devicePixelRatio*2,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        widget.detail,
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          color: Color(0xff757575),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(context).devicePixelRatio*1,
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width*0.6,
                                                        height: MediaQuery.of(context).size.height*0.05,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Color(0xff5581F1),
                                                            width: 2,
                                                          )
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "ยกเลิก",
                                                            style: TextStyle(
                                                              color: Color(0xff5581F1),
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                                  InkWell(
                                                    onTap: (){
                                                      Navigator.of(context).pop();
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return Scaffold(
                                                              backgroundColor: Colors.transparent,
                                                              body: SafeArea(
                                                                child: Stack(
                                                                  children: [
                                                                    // Confetti GIF as the background
                                                                    Positioned.fill(
                                                                      child: Image.asset(
                                                                        'assets/confetti.gif',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    // Centered Dialog Container
                                                                    Dialog(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0)), //this right here
                                                                      child: Container(
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                            0.38,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                            0.8,
                                                                        child: Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .end,
                                                                              children: [
                                                                                IconButton(
                                                                                  onPressed: () {
                                                                                    Navigator.of(
                                                                                        context)
                                                                                        .pop();
                                                                                  },
                                                                                  icon: Icon(Icons
                                                                                      .clear_rounded),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Center(
                                                                              child: Image.asset(
                                                                                "assets/air_fryer2.png",
                                                                                width: MediaQuery
                                                                                    .of(context)
                                                                                    .size
                                                                                    .width
                                                                                    *0.3,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "สำเร็จ!",
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 40,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              "แลกของรางวัลแล้ว",
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: 24,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(context).devicePixelRatio*2,
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width*0.6,
                                                        height: MediaQuery.of(context).size.height*0.05,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(20),
                                                            ),
                                                            color: Color(0xff5581F1),
                                                            border: Border.all(
                                                              color: Color(0xff5581F1),
                                                              width: 2,
                                                            )
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "ยืนยัน",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    width: MediaQuery.of(context).size.width*0.7,
                                    height: MediaQuery.of(context).size.height*0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffFCB0C2),
                                            Color(0xffF4BFCF),
                                            Color(0xffF0C5F1),
                                            Color(0xffE3DEF4),
                                            Color(0xffC1E1E7),
                                            Color(0xffC1E1E6),
                                          ]
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "แลกของรางวัล",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
