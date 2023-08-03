import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:gradient_borders/gradient_borders.dart';

class HeartButton extends StatefulWidget {
  final String buttonText;
  final List<Color> gradientColors;

  HeartButton({required this.buttonText, required this.gradientColors});

  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).devicePixelRatio * 2),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            gradient: LinearGradient(
              begin: isSelected ? Alignment.centerLeft : Alignment.centerRight,
              end: isSelected ? Alignment.centerRight : Alignment.centerLeft,
              colors: widget.gradientColors,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).devicePixelRatio * 8, right: MediaQuery.of(context).devicePixelRatio * 2),
                child: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                widget.buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartButtonSwitcher extends StatefulWidget {
  @override
  _HeartButtonSwitcherState createState() => _HeartButtonSwitcherState();
}

class _HeartButtonSwitcherState extends State<HeartButtonSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeartButton(
          buttonText: "รับหัวใจ",
          gradientColors: [
            Color(0xffFCB0C2),
            Color(0xffF4BFCF),
            Color(0xffF0C5F1),
            Color(0xffE3DEF4),
            Color(0xffC1E1E7),
            Color(0xffC1E1E6),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).devicePixelRatio * 2),
          child: HeartButton(
            buttonText: "ส่งหัวใจ",
            gradientColors: [
              Colors.white,
              Color(0xff757575).withOpacity(0.3),
            ],
          ),
        ),
      ],
    );
  }
}