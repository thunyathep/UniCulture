// To parse this JSON data, do
//
//     final rewardModel = rewardModelFromJson(jsonString);

import 'dart:convert';

import 'package:unihr/feature/reward/domain/entity/myreward_entity.dart';


List<MyRewardModel> MyrewardModelFromJson(String str) =>
    List<MyRewardModel>.from(json.decode(str).map((x) => MyRewardModel.fromJson(x)));

String MyrewardModelToJson(List<MyRewardModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyRewardModel extends MyRewardEntity {
  MyRewardModel({
    required int idRedeem,
    required String redeemDate,
    required int? redeemStatus,
    required String? receivedDate,
    required int? idReward,
    required String? name,
    required String? detail,
    required String? image,
    required CoinType? coin,
    CoinType? specialCoin,
  }):super(
    idRedeem : idRedeem,
    redeemDate: redeemDate,
    redeemStatus: redeemStatus,
    receivedDate: receivedDate,
    idReward: idReward,
    name: name,
    detail: detail,
    image: image,
    coin : coin,
    specialCoin : specialCoin,
  );

  factory MyRewardModel.fromJson(Map<String, dynamic> json) => MyRewardModel(
    idRedeem: json["idRedeem"],
    redeemDate: json["redeemDate"],
    redeemStatus: json["redeemStatus"],
    receivedDate: json["receivedDate"],
    idReward: json["idReward"],
    name: json["name"],
    detail: json["detail"],
    image: json["image"],
    coin: json["coin"] == null ? null : CoinType.fromJson(json["coin"]),
    specialCoin: json["specialCoin"] == null ? null : CoinType.fromJson(json["specialCoin"]),
  );

  Map<String, dynamic> toJson() => {
    "idRedeem": idRedeem,
    "redeemDate": redeemDate,
    "redeemStatus": redeemStatus,
    "receivedDate" : receivedDate,
    "idReward": idReward,
    "name": name,
    "detail": detail,
    "image": image,
    "coin": coin?.toJson(),
    "specialCoin": specialCoin?.toJson(),
  };
}