import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/question_entity.dart';
import '../pages/YearQuestionDetail.dart';

class Card_Morale extends StatefulWidget {
  final int? idMoraleParticipant;
  final int? idEmployee;
  final int? idMorale;
  final String? status;
  final String? moraleName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? moraleStatus;
  final String? moraleType;
  final List<QuestionTopic>? questionTopic;
  const Card_Morale({Key? key,
    required this.idMoraleParticipant,
    required this.idEmployee,
    required this.idMorale,
    required this.status,
    required this.moraleName,
    required this.startDate,
    required this.endDate,
    required this.moraleStatus,
    required this.moraleType,
    required this.questionTopic,
  }) : super(key: key);

  @override
  State<Card_Morale> createState() => _Card_MoraleState();
}

class _Card_MoraleState extends State<Card_Morale> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          if(widget.status == "incomplete"){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => YearQuestion(
                  idMoraleParticipant: widget.idMoraleParticipant,
                  idEmployee: widget.idEmployee,
                  idMorale: widget.idMorale,
                  status: widget.status,
                  moraleName: widget.moraleName,
                  startDate: widget.startDate,
                  endDate: widget.endDate,
                  moraleStatus: widget.moraleStatus,
                  moraleType: widget.moraleType,
                  questionTopic: widget.questionTopic,
              )),
            );
        }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => YearQuestion(
        //     idMoraleParticipant: widget.idMoraleParticipant,
        //     idEmployee: widget.idEmployee,
        //     idMorale: widget.idMorale,
        //     status: widget.status,
        //     moraleName: widget.moraleName,
        //     startDate: widget.startDate,
        //     endDate: widget.endDate,
        //     moraleStatus: widget.moraleStatus,
        //     moraleType: widget.moraleType,
        //     questionTopic: widget.questionTopic,
        //   )),
        // );
      },
      child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffFCB0C2),
                        Color(0xffF4BFCF),
                        Color(0xffF0C5F1),
                        Color(0xffE3DEF4),
                        Color(0xffC1E1E7),
                        Color(0xffC1E1E6),
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ]
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).devicePixelRatio*3,
                  top: MediaQuery.of(context).devicePixelRatio*3,
                ),
                child: Text(
                  widget.moraleName!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*3,
                    left: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Text(
                    "จำนวนหัวข้อ : "+widget.questionTopic!.length.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*3,
                    left: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Text(
                    "วันที่เริ่มต้น : "+DateFormat("d/M/y").format(widget.startDate!),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*3,
                    left: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Text(
                    "วันสิ้นสุด : "+DateFormat("d/M/y").format(widget.endDate!),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*3,
                    left: MediaQuery.of(context).devicePixelRatio*5,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.35,
                    decoration: BoxDecoration(
                      color: widget.status == "complete" ?
                            Color(0xff6ED33F).withOpacity(0.5)
                          : Color(0xffFCD462).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.status == "complete" ? "ตอบคำถามแล้ว" : "ยังไม่ได้ตอบคำถาม",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
