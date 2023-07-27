import 'package:flutter/material.dart';

class HomepageActivity extends StatefulWidget {
  final String image;
  final String title;
  final String status;
  const HomepageActivity({Key? key,
    required this.image,
    required this.title,
    required this.status,
  }) : super(key: key);

  @override
  State<HomepageActivity> createState() => _HomepageActivityState();
}

class _HomepageActivityState extends State<HomepageActivity> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).devicePixelRatio * 8,
          vertical: MediaQuery.of(context).devicePixelRatio * 8,
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
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-1, -1),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
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
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 27,
                    left: MediaQuery.of(context).devicePixelRatio * 18,
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio * 20,
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
                        "จังหวัดระยอง",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 2,
                    left: MediaQuery.of(context).devicePixelRatio * 5,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 2),
                        child: Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Text(
                        "เริ่ม : 1 May 2023 / สิ้นสุด : 1 May 2023",
                        style: TextStyle(
                          fontSize: 8,
                          color: Color(0xff757575),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 2,
                    left: MediaQuery.of(context).devicePixelRatio * 5,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 2),
                        child: Icon(
                          Icons.group,
                          color: Color(0xFF757575),
                          size: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Text(
                        "สถานะกิจกรรม",
                        style: TextStyle(
                          fontSize: 8,
                          color: Color(0xff757575),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio * 2,
                        ),
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Color(0xFF6ED33F),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left:
                              MediaQuery.of(context).devicePixelRatio * 1.5),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 2,
                          left: MediaQuery.of(context).devicePixelRatio * 3,
                        ),
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Row(
                          children: [
                            Image.asset("assets/coin2.png"),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio * 1,
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
                                  left: MediaQuery.of(context).devicePixelRatio *
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
              alignment: Alignment(-0.8, -0.3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.1,
                color: Color(0xFF5B4589),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "JUN",
                      style: TextStyle(
                        color: Colors.white,
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
