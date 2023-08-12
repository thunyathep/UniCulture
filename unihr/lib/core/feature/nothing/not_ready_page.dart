import 'package:flutter/material.dart';

class NotReady extends StatefulWidget {
  const NotReady({Key? key}) : super(key: key);

  @override
  State<NotReady> createState() => _NotReadyState();
}

class _NotReadyState extends State<NotReady> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
