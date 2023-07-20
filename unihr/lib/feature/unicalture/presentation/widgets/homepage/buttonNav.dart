import 'package:flutter/material.dart';

class ButtonFeature extends StatefulWidget {
  final String feature;
  final String image;
  final Widget pages;
  const ButtonFeature({Key? key,
    required this.feature,
    required this.image,
    required this.pages,
  }) : super(key: key);

  @override
  State<ButtonFeature> createState() => _ButtonFeatureState();
}

class _ButtonFeatureState extends State<ButtonFeature> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widget.pages),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).devicePixelRatio *2,
              left: MediaQuery.of(context).devicePixelRatio * 2,
              top: MediaQuery.of(context).devicePixelRatio * 3,
            ),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.16,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFF7AAA),
            ),
            child: Center(
              child: Image.asset(widget.image),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).devicePixelRatio * 2,
              left: MediaQuery.of(context).devicePixelRatio * 2,
              top: MediaQuery.of(context).devicePixelRatio * 2,
            ),
            child: Text(
              widget.feature,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
