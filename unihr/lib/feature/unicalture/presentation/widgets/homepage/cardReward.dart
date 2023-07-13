import 'package:flutter/material.dart';

class HomepageReward extends StatefulWidget {
  final String title;
  final String image;
  final int quantity;

  const HomepageReward({Key? key,
    required this.title,
    required this.image,
    required this.quantity}) : super(key: key);

  @override
  State<HomepageReward> createState() => _HomepageRewardState();
}

class _HomepageRewardState extends State<HomepageReward> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Align(
            alignment: Alignment(-1, -1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.135,
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
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      "หมดเขต: 31 Mar 2023",
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 2,
                      left: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      "avaliable: "+ widget.quantity.toString(),
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff757575),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                ],
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
                          Image.asset("assets/coin.png"),
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
                          Image.asset(
                            "assets/heart.png",
                            width: MediaQuery.of(context).size.width * 0.06,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    1),
                            child: Text(
                              "x10",
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
        ],
      ),
    );
  }
}
