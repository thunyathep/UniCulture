import 'package:flutter/material.dart';
import 'package:unihr/feature/unicalture/presentation/bloc/feedback/feedback_bloc.dart';

import '../../pages/activity/DetailAllActivity.dart';


class CardActivity extends StatefulWidget {
  final String image;
  final String title;
  final String status;

  const CardActivity({Key? key,
    required this.title,
    required this.image,
    required this.status,
  }) : super(key: key);

  @override
  State<CardActivity> createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailAllActivity())
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
                  child: Image.asset(
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
                    widget.title,
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
                        "จังหวัดระยอง",
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
                      Text(
                        "เริ่มรับสมัคร : 1 May 2023 - 23 May 2023",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color:  Color(0xff757575),
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
