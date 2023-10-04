import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../question/domain/entity/question_entity.dart';
import '../../domain/entities/threesixty_entity.dart';
import '../pages/questionthreesixty.dart';

class CardThreeSixty extends StatefulWidget {
  final int idAppraisee;
  final int idAssessment;
  final int scale;
  final int idEmployee;
  final String firstname;
  final String lastname;
  final String position;
  final String department;
  final String assessmentName;
  final String assessmentType;
  final String assessmentDescription;
  final DateTime startdate;
  final DateTime enddate;
  final List<SampleSize>? sampleSize;
  final List<QuestionListThreeSixty>? questionlist;

  CardThreeSixty({
    Key? key,
    required this.idAppraisee,
    required this.idAssessment,
    required this.idEmployee,
    required this.scale,
    required this.firstname,
    required this.lastname,
    required this.position,
    required this.department,
    required this.assessmentName,
    required this.assessmentType,
    required this.assessmentDescription,
    required this.startdate,
    required this.enddate,
    required this.sampleSize,
    required this.questionlist,
  }) : super(key: key);

  @override
  State<CardThreeSixty> createState() => _CardThreeSixtyState();
}

class _CardThreeSixtyState extends State<CardThreeSixty> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ThreeSixtyQuestion(
              idAppraisee: widget.idAppraisee,
              idAssessment: widget.idAssessment,
              idEmployee: widget.idEmployee,
              scale: widget.scale,
              firstname: widget.firstname,
              lastname: widget.lastname,
              position: widget.position,
              department: widget.department,
              assessmentName: widget.assessmentName,
              assessmentType: widget.assessmentType,
              assessmentDescription: widget.assessmentDescription,
              startdate: widget.startdate,
              enddate: widget.enddate,
              sampleSize: widget.sampleSize,
              questionlist: widget.questionlist,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio * 10,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
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
                        height: MediaQuery.of(context).size.height * 0.13,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).devicePixelRatio * 6,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/pikachu.jpg'),
                          radius: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).devicePixelRatio * 3,
                            left: MediaQuery.of(context).devicePixelRatio * 3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.firstname + " " + widget.lastname,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                widget.position,
                                style: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                widget.department,
                                style: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: 14,
                                ),
                              ),
                            ],
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
                top: MediaQuery.of(context).devicePixelRatio * 3,
                left: MediaQuery.of(context).devicePixelRatio * 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "แบบประเมิน: " + widget.assessmentName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "คำอธิบาย: " + widget.assessmentDescription,
                    style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "จำนวน: " + widget.questionlist!.length.toString() + " ข้อ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "ระยะเวลาการประเมิน: " +
                        DateFormat("d MMM y ").format(widget.startdate) +
                        " - " +
                        DateFormat("d MMM y").format(widget.enddate),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
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
