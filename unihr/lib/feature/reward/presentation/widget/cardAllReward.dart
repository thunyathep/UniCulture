import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_bloc.dart';

import '../../domain/entity/redeem_reward_entity.dart';
import '../pages/DetailReward.dart';

class CardAllReward extends StatefulWidget {
  final int idCompanyReward;
  final String name;
  final String detail;
  final String image;
  final String rewardManager;
  final String contact;
  final dynamic location;
  final int idRewardType;
  final List<Item> items;
  final List<Images> images;
  final List<ThreeSixtyModelOption> options;
  final int idUniReward;
  const CardAllReward(
      {Key? key,
      required this.idCompanyReward,
      required this.name,
      required this.detail,
      required this.image,
      required this.rewardManager,
      required this.contact,
      this.location,
      required this.idRewardType,
      required this.items,
      required this.images,
      required this.options,
      required this.idUniReward})
      : super(key: key);

  @override
  State<CardAllReward> createState() => _CardAllRewardState();
}

class _CardAllRewardState extends State<CardAllReward> {
  // late DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    // dateTime = DateTime.parse(widget.endDate);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailReward(
                  idCompanyReward: widget.idCompanyReward,
                  name: widget.name,
                  detail: widget.detail,
                  image: widget.image,
                  rewardManager: widget.rewardManager,
                  contact: widget.contact,
                  idRewardType: widget.idRewardType,
                  items: widget.items,
                  images: widget.images,
                  options: widget.options,
                  idUniReward: widget.idUniReward)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
            color: Colors.white),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).devicePixelRatio * 5,
                right: MediaQuery.of(context).devicePixelRatio * 5,
              ),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 15,
                  ),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 2,
                    bottom: MediaQuery.of(context).devicePixelRatio * 2,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "",
                          // widget.detail,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Text(
                //   "คลัง: "+ widget.quantity.toString(),
                //   style: TextStyle(
                //     fontSize: 8,
                //     color:  Color(0xff757575),
                //   ),
                // ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/heart.png',
                          width: MediaQuery.of(context).size.width * 0.07,
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Text('x10'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
