import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../domain/entity/communicate_entity.dart';
import '../bloc/communicate_bloc.dart';
import '../page/DetailSuggestion.dart';

class Card_Suggestion extends StatefulWidget {
  final CommunicateBloc communicateBloc;
  final int idCommunicate;
  final String? type;
  final String detail;
  final dynamic file;
  final String createDate;
  final String? status;
  final int? reward;
  final String? rewardDate;
  final int createBy;
  final String firstName;
  final String lastName;
  final List<ReplyList> replyList;
  final List<LikeList> likeList;

  const Card_Suggestion({Key? key,
    required this.communicateBloc,
    required this.idCommunicate,
    required this.type,
    required this.detail,
    required this.file,
    required this.createDate,
    required this.status,
    required this.reward,
    required this.rewardDate,
    required this.createBy,
    required this.firstName,
    required this.lastName,
    required this.replyList,
    required this.likeList,
  }) : super(key: key);

  @override
  State<Card_Suggestion> createState() => _Card_SuggestionState();
}

class _Card_SuggestionState extends State<Card_Suggestion> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>DetailSuggestion(
              communicateBloc: widget.communicateBloc,
              idCommunicate: widget.idCommunicate,
              type: widget.type?? "",
              detail: widget.detail,
              file: widget.file,
              createDate: widget.createDate,
              status: widget.status??"",
              reward: widget.reward??0,
              rewardDate: widget.rewardDate??"",
              createBy: widget.createBy,
              firstName: widget.firstName,
              lastName: widget.lastName,
              replyList: widget.replyList,
              likeList: widget.likeList
          )),
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
