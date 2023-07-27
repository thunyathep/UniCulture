import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMyReward extends StatelessWidget {
  const ShimmerMyReward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromRGBO(222, 227, 227, 0.75),
      highlightColor: Color.fromRGBO(245, 247, 247, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).devicePixelRatio*5
            ),
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(222, 227, 227, 0.75)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).devicePixelRatio*5
            ),
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(222, 227, 227, 0.75)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).devicePixelRatio*5
            ),
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(222, 227, 227, 0.75)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).devicePixelRatio*5
            ),
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(222, 227, 227, 0.75)),
            ),
          ),

        ],
      ),
    );
  }
}
