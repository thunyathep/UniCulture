import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'dart:math' as math;

import 'package:unihr/feature/feedback/presentation/bloc/feedback_bloc.dart';


class SelectFeedback extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final int value;
  const SelectFeedback({Key? key,
    required this.text,
    required this.icon,
    required this.isActive,
    required this.value,
  }) : super(key: key);

  @override
  State<SelectFeedback> createState() => _SelectFeedbackState();
}

class _SelectFeedbackState extends State<SelectFeedback> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.35,
        height: MediaQuery.of(context).size.height*0.05,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xff757575).withOpacity(0.3),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          gradient: _isTapped ? LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xffFCB0C2),
              Color(0xffF4BFCF),
              Color(0xffF0C5F1),
              Color(0xffE3DEF4),
              Color(0xffC1E1E7),
              Color(0xffC1E1E6),
            ],
          ) : null,
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context)
                      .devicePixelRatio*3,
                  right: MediaQuery.of(context)
                      .devicePixelRatio*2
              ),
              child: Transform.rotate(
                angle: 180 * math.pi/widget.value,
                child: Icon(
                  widget.icon,
                  color: _isTapped ? Colors.black
                      : Color(0xff757575),
                ),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: _isTapped ? Colors.black
                    : Color(0xff757575),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
