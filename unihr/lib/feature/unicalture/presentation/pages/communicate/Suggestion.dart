import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'dart:math' as math;

import 'AddSuggestion.dart';
import 'DetailSuggestion.dart';



class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).devicePixelRatio*2,
                      ),
                      child: Image.asset(
                        'assets/chatbox.png',
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.27,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*22,
                      left: MediaQuery.of(context).devicePixelRatio*20,
                    ),
                    child: Text(
                      "บอร์ดพูดคุย",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
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
                      ],
                    ),
                  ),


                ],
              ),
              Column(
                children: [
                  Card_Suggest(context),
                  Card_Suggest(context),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AddSuggestion()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Color(0xff757575),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xff757575),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).devicePixelRatio*1,
                              left: MediaQuery.of(context).devicePixelRatio*2,
                            ),
                            child: Text(
                              "สร้างข้อเสนอแนะ",
                              style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Card_Suggest (BuildContext){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>DetailSuggestion()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio*10,
        ),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.13,
              child: Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      child: Image.asset(
                        "assets/mission_card.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.13,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*10,
                      left: MediaQuery.of(context).devicePixelRatio*10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Topic",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio*2
                          ),
                          child: Text(
                            "description",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xff757575),
                                fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).devicePixelRatio*2,
                left: MediaQuery.of(context).devicePixelRatio*5,
                right: MediaQuery.of(context).devicePixelRatio*5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/pikachu.jpg'),
                        radius: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*5,
                        ),
                        child: const Text(
                            "Puttinun Moungprasert",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  LikeButton(
                    size: MediaQuery.of(context).size.width*0.1,
                    circleColor:
                    const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color(0xff33b5e5),
                      dotSecondaryColor: Color(0xff5581F1),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.thumb_up,
                        color: isLiked ? Color(0xff5581F1) : Colors.grey,
                        size: MediaQuery.of(context).size.width*0.07,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
