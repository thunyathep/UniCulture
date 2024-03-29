import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:icon_decoration/icon_decoration.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_event.dart';
import 'package:unihr/feature/activity/presentation/bloc/activity_state.dart';

import '../../../../core/storage/secure_storage.dart';
import '../../../../injection_container.dart';
import '../bloc/activity_bloc.dart';

class DetailMyActivity extends StatefulWidget {
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

  DetailMyActivity({
    Key? key,
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
  State<DetailMyActivity> createState() => _DetailMyActivityState();
}

class _DetailMyActivityState extends State<DetailMyActivity> {
  final ActivityBloc _activityBloc = sl<ActivityBloc>();
  late DateTime startRegisTime;
  late DateTime endRegisTime;
  late DateTime startTime;
  late DateTime endTime;
  int idEmployee = 0;
  Future<void> getId() async {
    String id = await LoginStorage.readEmployeeId();
    try {
      idEmployee = int.parse(id);
      // Now, you can use idSender as an int.
      print("Parsed integer ID: $idEmployee");
    } catch (e) {
      // Handle the case where the string cannot be parsed as an integer.
      print("Error parsing string to int: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    startRegisTime = DateTime.parse(widget.openRegisDate);
    endRegisTime = DateTime.parse(widget.closeRegisDate);
    startTime = DateTime.parse(widget.startDate);
    endTime = DateTime.parse(widget.endDate);
    int idActivity = widget.idActivity;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _activityBloc,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 20,
                      left: MediaQuery.of(context).devicePixelRatio * 5,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: DecoratedIcon(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                        decoration: IconDecoration(
                          border:
                              IconBorder(color: Color(0xff757575), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 1,
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
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.98,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.white.withOpacity(
                                          0.2), // Start color with opacity
                                      Color(0xffE299AA).withOpacity(
                                          0.5), // End color with opacity
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Text(
                                widget.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                    ),
                                    child: Icon(
                                      Icons.group,
                                      color: Color(0xFF757575),
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                  Text(
                                    "สถานะกิจกรรม",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff757575),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Color(0xFF6ED33F),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            1.5,
                                        right: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            1.5,
                                        top: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            1,
                                        bottom: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            1,
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
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                      bottom: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                    ),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Color(0xFF757575),
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "สถานที่จัดกิจกรรม",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff757575),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                      bottom: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          8,
                                    ),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Color(0xFF757575),
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                2),
                                        child: Text(
                                          "ระยะเวลารับสมัคร",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff757575),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'เริ่ม : ' +
                                            DateFormat("d MMM y")
                                                .format(startRegisTime),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                      Text(
                                        'สิ้นสุด : ' +
                                            DateFormat("d MMM y")
                                                .format(endRegisTime),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                      bottom: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          8,
                                    ),
                                    child: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color(0xFF757575),
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                2),
                                        child: Text(
                                          "ระยะเวลากิจกกรม",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff757575),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'เริ่ม : ' +
                                            DateFormat("d MMM y")
                                                .format(startTime),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                      Text(
                                        'สิ้นสุด : ' +
                                            DateFormat("d MMM y")
                                                .format(endTime),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                bottom:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    10,
                                right: MediaQuery.of(context).devicePixelRatio *
                                    10,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
                                      bottom: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          8,
                                    ),
                                    child: Icon(
                                      Icons.contact_phone_rounded,
                                      color: Color(0xFF757575),
                                      size: MediaQuery.of(context).size.height *
                                          0.03,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                2),
                                        child: Text(
                                          "ข้อมูลผู้จัดกิจกรรม",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff757575),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'ชื่อผู้จัด : ' + widget.organizer,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                      Text(
                                        'ช่องทางการติดต่อ : ' + widget.contact,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff757575),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).devicePixelRatio,
                                right:
                                    MediaQuery.of(context).devicePixelRatio * 5,
                              ),
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
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
                                      left: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          1,
                                      right: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          2,
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
                                        left: MediaQuery.of(context)
                                                .devicePixelRatio *
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
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio *
                                      5,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    getId();
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)), //this right here
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.27,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(
                                                                  context)
                                                              .devicePixelRatio *
                                                          5,
                                                    ),
                                                    child: Text(
                                                      "ยกเลิกการเข้าร่วมกิจกรรม",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(
                                                                  context)
                                                              .devicePixelRatio *
                                                          5,
                                                    ),
                                                    child: Text(
                                                      "คุณต้องยืนยันการยกเลิกลงทะเบียนเข้าร่วมกิจกรรม",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff757575),
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: MediaQuery.of(
                                                                  context)
                                                              .devicePixelRatio *
                                                          2,
                                                    ),
                                                    child: Text(
                                                      widget.name,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff757575),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      _activityBloc.add(
                                                          UnRegisterActivity(
                                                          idActivity: idActivity,
                                                              idEmployee: idEmployee
                                                          ));
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .devicePixelRatio *
                                                            5,
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                color: Color(
                                                                    0xffF05F5F),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xffF05F5F),
                                                                  width: 2,
                                                                )),
                                                        child: Center(
                                                          child: Text(
                                                            "ยืนยัน",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .devicePixelRatio *
                                                            2,
                                                      ),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xff5581F1),
                                                                  width: 2,
                                                                )),
                                                        child: Center(
                                                          child: Text(
                                                            "ยกเลิก",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff5581F1),
                                                              fontSize: 12,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: Color(0xffF05F5F),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "ยกเลิกการลงทะเบียน",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
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
                  ),
                  Align(
                    alignment: Alignment(0.7, -0.25),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff757575).withOpacity(0.3),
                          width: 10,
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.18,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffFCDDDD),
                                Color(0xffFEA1C3),
                              ]),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 2,
                              ),
                              child: Text(
                                DateFormat("d").format(startTime),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              DateFormat("MMM").format(startTime),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
