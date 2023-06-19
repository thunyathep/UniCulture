import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:unihr/screen/AllActivity.dart';
import 'package:unihr/screen/DiaryQuestion.dart';
import 'package:unihr/screen/HomePage.dart';
import 'package:unihr/screen/SentHeart.dart';


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
        Page = SentHeart();
        break;
      case 2:
        Page = DiaryQuestion();
        break;
      case 3:
        Page = AllActivity();
        break;
      case 4:
        Page = HomePage();
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

