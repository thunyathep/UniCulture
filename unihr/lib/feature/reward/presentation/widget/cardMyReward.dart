import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../bloc/reward_bloc.dart';

class CardMyReward extends StatefulWidget {
  final RewardBloc rewardBloc;
  final int idRedeem;
  final String redeemDate;
  final int redeemStatus;
  final String receivedDate;
  final int idreward;
  final String name;
  final String detail;
  final String image;

  const CardMyReward({Key? key,
    required this.rewardBloc,
    required this.idRedeem,
    required this.redeemDate,
    required this.redeemStatus,
    required this.receivedDate,
    required this.idreward,
    required this.name,
    required this.detail,
    required this.image,
  }) : super(key: key);

  @override
  State<CardMyReward> createState() => _CardMyRewardState();
}

class _CardMyRewardState extends State<CardMyReward> {
  late DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    dateTime = DateTime.parse(widget.receivedDate);
    return InkWell(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        height: MediaQuery.of(context).size.height*0.25,
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
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).devicePixelRatio*5,
                right: MediaQuery.of(context).devicePixelRatio*5,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.2,
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
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio*10,
                      bottom: MediaQuery.of(context).devicePixelRatio*5,
                    ),
                    // width: MediaQuery.of(context).size.width*0.2,
                    // height: MediaQuery.of(context).size.height*0.01,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color(0xff6ED33F),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio*3,
                        right: MediaQuery.of(context).devicePixelRatio*3,
                      ),
                      child: Center(
                        child: Text(
                          "สำเร็จ",
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*2,
                    bottom: MediaQuery.of(context).devicePixelRatio*2,
                  ),
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.detail,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio*2
                      ),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xFF757575),
                        size: MediaQuery.of(context).size.height*0.02,
                      ),
                    ),
                    Text(
                      DateFormat("d MMM y , H:M").format(dateTime),
                      style: TextStyle(
                        fontSize: 8,
                        color:  Color(0xff757575),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.07,
                      height: MediaQuery.of(context).size.height*0.05,
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
