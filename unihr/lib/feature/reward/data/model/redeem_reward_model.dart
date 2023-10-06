import 'dart:convert';

import '../../domain/entity/redeem_reward_entity.dart';



List<RedeemRewardModel> RedeemRewardModelFromJson(String str) =>
    List<RedeemRewardModel>.from(json.decode(str).map((x) => RedeemRewardModel.fromJson(x)));

String RedeemRewardModelToJson(List<RedeemRewardModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RedeemRewardModel extends RedeemRewardEntity {
  RedeemRewardModel({
    required int? idCompanyReward,
    required String? name,
    required String? detail,
    required String? image,
    required String? rewardManager,
    required String? contact,
    required dynamic location,
    required int? idRewardType,
    required List<Item>? items,
    required List<Images>? images,
    required List<ThreeSixtyModelOption>? options,
    required int? idUniReward,
  }):super(
    idCompanyReward: idCompanyReward,
    name: name,
    detail: detail,
    rewardManager: rewardManager,
    contact: contact,
    location: location,
    image: image,
    idRewardType: idRewardType,
    items: items,
    images: images,
    options: options,
    idUniReward: idUniReward,
  );

  factory RedeemRewardModel.fromJson(Map<String, dynamic> json) => RedeemRewardModel(
    idCompanyReward: json["idCompanyReward"],
    name: json["name"],
    detail: json["detail"],
    image: json["image"],
    rewardManager: json["rewardManager"],
    contact: json["contact"],
    location: json["location"],
    idRewardType: json["idRewardType"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    images: json["images"] == null ? [] : List<Images>.from(json["images"]!.map((x) => Images.fromJson(x))),
    options: json["options"] == null ? [] : List<ThreeSixtyModelOption>.from(json["options"]!.map((x) => ThreeSixtyModelOption.fromJson(x))),
    idUniReward: json["idUniReward"],
  );

  Map<String, dynamic> toJson() => {
    "idCompanyReward": idCompanyReward,
    "name": name,
    "detail": detail,
    "image": image,
    "rewardManager": rewardManager,
    "contact": contact,
    "location": location,
    "idRewardType": idRewardType,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "idUniReward": idUniReward,
  };
}