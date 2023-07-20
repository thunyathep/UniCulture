// To parse this JSON data, do
//
//     final rewardModel = rewardModelFromJson(jsonString);

import 'dart:convert';

import 'package:unihr/feature/homepage/domain/entity/reward_entity.dart';

List<RewardModel> rewardModelFromJson(String str) =>
    List<RewardModel>.from(json.decode(str).map((x) => RewardModel.fromJson(x)));

String rewardModelToJson(List<RewardModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RewardModel extends RewardEntity {
  RewardModel({
    required int idReward,
    required String name,
    required String detail,
    required int price,
    required int quantity,
    required String startDate,
    required String endDate,
    required String rewardManager,
    required String contact,
    required String location,
    required String image,
    // required Coin coin,
    // required Coin specialCoin,
  }):super(
    idReward: idReward,
    name : name,
    detail : detail,
    price : price,
    quantity : quantity,
    startDate : startDate,
    endDate : endDate,
    rewardManager : rewardManager,
    contact : contact,
    location : location,
    image : image,
    // coin : coin,
    // specialCoin : specialCoin ?? null,
  );

  factory RewardModel.fromJson(Map<String, dynamic> json) => RewardModel(
    idReward: json["idReward"],
    name: json["name"],
    detail: json["detail"],
    price: json["price"],
    quantity: json["quantity"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    rewardManager: json["rewardManager"],
    contact: json["contact"],
    location: json["location"],
    image: json["image"],
    // coin: json["coin"] == null ? null : Coin.fromJson(json["coin"]),
    // specialCoin: json["specialCoin"] == null ? null : Coin.fromJson(json["specialCoin"]),
  );

  Map<String, dynamic> toJson() => {
    "idReward": idReward,
    "name": name,
    "detail": detail,
    "price": price,
    "quantity": quantity,
    "startDate": startDate,
    "endDate": endDate,
    "rewardManager": rewardManager,
    "contact": contact,
    "location": location,
    "image": image,
    // "coin": coin?.toJson(),
    // "specialCoin": specialCoin?.toJson(),
  };
}

// class Coin {
//   final int? idCoinType;
//   final int? amount;
//   final String? coinType;
//
//   Coin({
//     this.idCoinType,
//     this.amount,
//     this.coinType,
//   });
//
//   factory Coin.fromJson(Map<String, dynamic> json) => Coin(
//     idCoinType: json["idCoinType"],
//     amount: json["amount"],
//     coinType: json["coinType"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "idCoinType": idCoinType,
//     "amount": amount,
//     "coinType": coinType,
//   };
// }

