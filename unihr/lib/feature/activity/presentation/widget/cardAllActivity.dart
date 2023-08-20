import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/feedback/presentation/bloc/feedback_bloc.dart';

import '../bloc/activity_bloc.dart';
import '../pages/DetailAllActivity.dart';


class CardActivity extends StatefulWidget {
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

  const CardActivity({Key? key,
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
  State<CardActivity> createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> {
  late DateTime startRegisTime;
  late DateTime endRegisTime;
  @override
  Widget build(BuildContext context) {
    startRegisTime = DateTime.parse(widget.openRegisDate);
    endRegisTime = DateTime.parse(widget.closeRegisDate);
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailAllActivity(
              idActivity: widget.idActivity,
              name: widget.name,
              detail: widget.detail,
              location: widget.location,
              startDate: widget.startDate,
              endDate: widget.endDate,
              openRegisDate: widget.openRegisDate,
              closeRegisDate: widget.closeRegisDate,
              organizer: widget.organizer,
              contact: widget.contact,
              image: widget.image,
              idActivityStatus: widget.idActivityStatus,
              status: widget.status,
              idEmployee: widget.idEmployee,
              participantStatus: widget.participantStatus,
            ))
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).devicePixelRatio*10,
        ),
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
              alignment: Alignment(-1,-1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width*1,
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
                    top: MediaQuery.of(context).devicePixelRatio*38,
                    left: MediaQuery.of(context).devicePixelRatio*25,
                  ),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*1,
                    left: MediaQuery.of(context).devicePixelRatio*25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right:
                            MediaQuery.of(context).devicePixelRatio*2
                        ),
                        child: Icon(
                          Icons.group,
                          color: Color(0xFF757575),
                          size:
                          MediaQuery.of(context).size.height*0.03,
                        ),
                      ),
                      Text(
                        "สถานะกิจกรรม",
                        style: TextStyle(
                          fontSize: 14,
                          color:  Color(0xff757575),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*2,
                        ),
                        width: MediaQuery.of(context).size.width*0.12,
                        height: MediaQuery.of(context).size.height*0.02,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xFF6ED33F),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio*25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio*2
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height*0.02,
                        ),
                      ),
                      Text(
                        widget.location,
                        style: TextStyle(
                          fontSize: 14,
                          color:  Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*1,
                    left: MediaQuery.of(context).devicePixelRatio*25,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio*2
                        ),
                        child: Icon(
                          Icons.access_time,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height*0.03,
                        ),
                      ),
                      Container(
                        child: Text(
                          "เริ่มรับสมัคร : "+DateFormat("d MMM y").format(startRegisTime)+
                              " - "+ DateFormat("d MMM y").format(endRegisTime),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color:  Color(0xff757575),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        AlertDialog(
                          title: const Text(
                            "ยืนยันการแลกของรางวัล",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio*3,
                          top: MediaQuery.of(context).devicePixelRatio*4,
                        ),
                        width: MediaQuery.of(context).size.width*0.22,
                        height: MediaQuery.of(context).size.height*0.03,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xff5581F1),
                        ),
                        child: Center(
                          child: Text(
                            "ลงทะเบียน",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*5,
                        left: MediaQuery.of(context).devicePixelRatio*3,
                      ),
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.4,
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
                              left: MediaQuery.of(context).devicePixelRatio*1,
                              right: MediaQuery.of(context).devicePixelRatio*2,
                            ),
                            child: Text("x3",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Image.asset("assets/Fast_move_coin.png"),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*1
                            ),
                            child: Text("x1",
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
              ],
            ),

            Align(
              alignment: Alignment(-0.9,0.1),
              child: Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.12,
                color: Color(0xFF5B4589),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("1",style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("JUN",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
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
