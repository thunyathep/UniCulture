
import 'dart:convert';

import 'package:unihr/feature/activity/domain/entity/myactivity_entity.dart';


List<MyActivityModel> MyactivityModelFromJson(String str) =>
    List<MyActivityModel>.from(json.decode(str).map((x) => MyActivityModel.fromJson(x)));

String MyactivityModelToJson(List<MyActivityModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyActivityModel extends MyActivityEntity {
  MyActivityModel({
    required int? idActivity,
    required String? activityType,
    required String? name,
    required String? detail,
    required String? location,
    required String? startDate,
    required String? endDate,
    required String? openRegisterDate,
    required String? closeRegisterDate,
    required String? organizer,
    required String? contact,
    required String? image,
    required int? idActivityStatus,
    required String? status,
    required int? idEmployee,
    required int? participantStatus,
    Coin? coin,
    Coin? specialCoin,
  }):super(
    idActivity: idActivity,
    activityType: activityType,
    name: name,
    detail: detail,
    location: location,
    startDate: startDate,
    endDate: endDate,
    openRegisterDate: openRegisterDate,
    closeRegisterDate: closeRegisterDate,
    organizer: organizer,
    contact: contact,
    image: image,
    idActivityStatus: idActivityStatus,
    status: status,
    idEmployee: idEmployee,
    participantStatus: participantStatus,
    coin : coin,
    specialCoin : specialCoin,
  );

  factory MyActivityModel.fromJson(Map<String, dynamic> json) => MyActivityModel(
    idActivity: json["idActivity"],
    activityType: json["activityType"],
    name: json["name"],
    detail: json["detail"],
    location: json["location"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    openRegisterDate: json["openRegisterDate"],
    closeRegisterDate: json["closeRegisterDate"],
    organizer: json["organizer"],
    contact: json["contact"],
    image: json["image"],
    idActivityStatus: json["idActivityStatus"],
    status: json["status"],
    idEmployee: json["idEmployee"],
    participantStatus: json["participantStatus"],
    coin: json["coin"] == null ? null : Coin.fromJson(json["coin"]),
    specialCoin: json["specialCoin"] == null ? null : Coin.fromJson(json["specialCoin"]),
  );

  Map<String, dynamic> toJson() => {
    "idActivity": idActivity,
    "activityType": activityType,
    "name": name,
    "detail": detail,
    "location": location,
    "startDate": startDate,
    "endDate": endDate,
    "openRegisterDate": openRegisterDate,
    "closeRegisterDate": closeRegisterDate,
    "organizer": organizer,
    "contact": contact,
    "image": image,
    "idActivityStatus": idActivityStatus,
    "status": status,
    "idEmployee": idEmployee,
    "participantStatus": participantStatus,
    "coin": coin?.toJson(),
    "specialCoin": specialCoin?.toJson(),
  };
}