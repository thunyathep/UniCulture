import 'package:flutter/material.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_bloc.dart';
import 'package:intl/intl.dart';

import '../pages/DetailMyActivity.dart';

class CardMyActivity extends StatefulWidget {
  final ActivityBloc activityBloc;
  final int idActivity;
  final String name;
  final String detail;
  final String location;
  final String startDate;
  final String endDate;
  final String openRegisDate;
  final String closeRegisDate;
  final String organizer;
  final String contact;
  final String image;
  final int idActivityStatus;
  final String status;
  final int idEmployee;
  final int participantStatus;

  const CardMyActivity({Key? key,
    required this.activityBloc,
    required this.idActivity,
    required this.name,
    required this.detail,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.openRegisDate,
    required this.closeRegisDate,
    required this.organizer,
    required this.contact,
    required this.image,
    required this.idActivityStatus,
    required this.status,
    required this.idEmployee,
    required this.participantStatus,
  }) : super(key: key);

  @override
  State<CardMyActivity> createState() => _CardMyActivityState();
}

class _CardMyActivityState extends State<CardMyActivity> {
  late DateTime startTime;
  late DateTime endTime;
  @override
  Widget build(BuildContext context) {
    startTime = DateTime.parse(widget.startDate);
    endTime = DateTime.parse(widget.endDate);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailMyActivity()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-1, -1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 38,
                    left: MediaQuery.of(context).devicePixelRatio * 25,
                  ),
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio * 25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 2),
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Text(
                        widget.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 1,
                    left: MediaQuery.of(context).devicePixelRatio * 25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 2),
                        child: Icon(
                          Icons.access_time,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                      Text(
                        "เริ่มกิจกรรม : "+DateFormat("d MMM y").format(startTime)+
                        " - "+ DateFormat("d MMM y").format(endTime),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 1,
                    left: MediaQuery.of(context).devicePixelRatio * 25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 2),
                        child: Icon(
                          Icons.group,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                      Text(
                        "สถานะกิจกรรม",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff757575),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xFF6ED33F),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio*1.5,
                            right: MediaQuery.of(context).devicePixelRatio*1.5,
                            top: MediaQuery.of(context).devicePixelRatio*1,
                            bottom: MediaQuery.of(context).devicePixelRatio*1,
                          ),
                          child: Center(
                            child: Text(
                              widget.status,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio * 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 5,
                          left: MediaQuery.of(context).devicePixelRatio * 3,
                        ),
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          children: [
                            Text(
                              'ได้รับ : ',
                              style: TextStyle(
                                color: Color(0xff757575),
                                fontSize: 12,
                              ),
                            ),
                            Image.asset("assets/coin2.png"),
                            Padding(
                              padding: EdgeInsets.only(
                                left:
                                MediaQuery.of(context).devicePixelRatio * 1,
                                right:
                                MediaQuery.of(context).devicePixelRatio * 2,
                              ),
                              child: Text(
                                "x3",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Image.asset("assets/Fast_move_coin.png"),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                  MediaQuery.of(context).devicePixelRatio *
                                      1),
                              child: Text(
                                "x1",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
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
            Align(
              alignment: Alignment(-0.9, 0.1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.12,
                color: Color(0xFF5B4589),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "JUN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
