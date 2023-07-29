
import 'dart:convert';

import 'package:unihr/feature/activity/domain/entity/allactivity_entity.dart';


List<AllActivityModel> AllactivityModelFromJson(String str) =>
    List<AllActivityModel>.from(json.decode(str).map((x) => AllActivityModel.fromJson(x)));

String MyactivityModelToJson(List<AllActivityModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllActivityModel extends AllActivityEntity {
  AllActivityModel({
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

  factory AllActivityModel.fromJson(Map<String, dynamic> json) => AllActivityModel(
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