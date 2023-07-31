import 'dart:convert';

import '../../domain/entity/activity_entity.dart';


List<ActivityModel> ActivityModelFromJson(String str) =>
    List<ActivityModel>.from(json.decode(str).map((x) => ActivityModel.fromJson(x)));

String MyactivityModelToJson(List<ActivityModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel extends ActivityEntity {
  ActivityModel({
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

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
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