import 'dart:convert';

import '../../domain/entity/redeem_reward_entity.dart';



List<RedeemRewardModel> RedeemRewardModelFromJson(String str) =>
    List<RedeemRewardModel>.from(json.decode(str).map((x) => RedeemRewardModel.fromJson(x)));

String RedeemRewardModelToJson(List<RedeemRewardModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RedeemRewardModel extends RedeemRewardEntity {
  RedeemRewardModel({
    required int? idReward,
    required String? name,
    required String? detail,
    required int? price,
    required int? quantity,
    required String? startDate,
    required String? endDate,
    required String? rewardManager,
    required String? contact,
    required String? location,
    required String? image,
    required Coin? coin,
    Coin? specialCoin,
  }):super(
    idReward: idReward,
    name: name,
    detail: detail,
    price: price,
    quantity: quantity,
    startDate: startDate,
    endDate: endDate,
    rewardManager: rewardManager,
    contact: contact,
    location: location,
    image: image,
    coin : coin,
    specialCoin : specialCoin,
  );

  factory RedeemRewardModel.fromJson(Map<String, dynamic> json) => RedeemRewardModel(
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
    coin: json["coin"] == null ? null : Coin.fromJson(json["coin"]),
    specialCoin: json["specialCoin"] == null ? null : Coin.fromJson(json["specialCoin"]),
  );

  Map<String, dynamic> toJson() => {
    "idReward": idReward,
    "name" : name,
    "detail" : detail,
    "price" : price,
    "quantity" : quantity,
    "startDate" : startDate,
    "endDate" : endDate,
    "rewardManager" : rewardManager,
    "contact" : contact,
    "location" : location,
    "image" : image,
    "coin": coin?.toJson(),
    "specialCoin": specialCoin?.toJson(),
  };
}