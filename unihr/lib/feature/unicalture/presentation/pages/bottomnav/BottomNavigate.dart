import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:unihr/feature/homepage/presentation/pages/HomePage.dart';

import '../../../../../core/feature/nothing/not_ready_page.dart';
import '../../../../activity/presentation/pages/AllActivity.dart';
import '../../../../heart/presentation/page/heart_transfer.dart';
import '../../../../question/presentation/pages/DiaryQuestion.dart';


class BottomNavigateBar extends StatefulWidget {
  const BottomNavigateBar({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<BottomNavigateBar> createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "หน้าแรก",
      Color(0xFFEC6C8B).withOpacity(0.5),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.favorite_border,
      "ส่งหัวใจ",
      Color(0xFFEC6C8B).withOpacity(0.5),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.notifications_on_outlined,
      "คำถามใจ",
      Color(0xFFEC6C8B).withOpacity(0.5),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.checklist_rounded,
      "กิจกรรม",
      Color(0xFFEC6C8B).withOpacity(0.5),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.person,
      "โปรไฟล์",
      Color(0xFFEC6C8B).withOpacity(0.5),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Centered Dialog Container
                    Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.height*0.8,
                            ),
                            Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.55,
                                width: MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.8,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "assets/pop_up.png",
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.55,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.8,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "WORK",
                                                style: TextStyle(
                                                  color: Color(0xffF04E75),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 32,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width*0.1,
                                                height: MediaQuery.of(context).size.height*0.04,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffF04E75),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    top: MediaQuery.of(context).devicePixelRatio*3,
                                                    left: MediaQuery.of(context).devicePixelRatio*1.5,
                                                  ),
                                                  child: Text(
                                                    "FROM",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "HOME",
                                                style: TextStyle(
                                                  color: Color(0xffF04E75),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                            right: MediaQuery.of(context).devicePixelRatio*10,
                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                          ),
                                          child: Text(
                                            "SCG ประกาศนโยบายให้พนักงาน WORK FROM HOME เพื่อป้องกันและลดความเสี่ยงการติดเชื้อ COVID-19",
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                          ),
                                          child: Text(
                                            "ตั้งแต่วันที่",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xffF04E75),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                            left: MediaQuery.of(context).devicePixelRatio*10,
                                          ),
                                          child: Text(
                                            "8 พฤษภาคม 2565 เป็นต้นไป",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffF04E75),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.212,
                                          width: MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*2,
                                          ),
                                          child: Image.asset(
                                            "assets/human_popup.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio*10,
                            ),
                            child: Image.asset(
                              "assets/megaphone.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context)=>DetailPopUp()),
                        // );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: MediaQuery.of(context).size.height*0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffF04E75),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*10,
                                right: MediaQuery.of(context).devicePixelRatio*3,
                              ),
                              child: Text(
                                "อ่านต่อเพื่อรับ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/coin2.png",
                              width: MediaQuery.of(context).size.width*0.07,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio*3,
                              ),
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).devicePixelRatio*6,
                    //   ),
                    //   child: InkWell(
                    //     onTap: (){
                    //       Navigator.of(context).pop();
                    //     },
                    //     child: Container(
                    //       width: MediaQuery.of(context).size.width*0.4,
                    //       height: MediaQuery.of(context).size.height*0.05,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         border: Border.all(
                    //           width: 1,
                    //           color: Colors.white,
                    //         ),
                    //         color: Colors.transparent,
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //               left: MediaQuery.of(context).devicePixelRatio*20,
                    //             ),
                    //             child: Text(
                    //               "ปิด",
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          });
    });
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Widget Page;
    switch (selectedPos) {
      case 0:
        Page = HomePage();
        break;
      case 1:
        Page = HeartTransfer();
        break;
      case 2:
        Page = DiaryQuestion();
        break;
      case 3:
        Page = AllActivity();
        break;
      case 4:
        Page = NotReady();
        break;
      default:
        Page = HomePage(); // Assign a default page in case of an unknown selectedPos value
        break;
    }
    return Page;
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,

      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}

