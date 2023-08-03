import 'dart:convert';

import '../../domain/entity/mission_entity.dart';

List<MyMissionModel> MyMissionModelFromJson(String str) =>
    List<MyMissionModel>.from(json.decode(str).map((x) => MyMissionModel.fromJson(x)));

String MyMissionModelToJson(List<MyMissionModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyMissionModel extends MissionEntity{
  MyMissionModel({
    required int idTasks,
    required String image,
    required String nameTask,
    required String detail,
    required String status,
    required String doDate,
    required String nameprinciple,
    Coin? coin,
    Coin? specialCoin,
}) :super(
    idTasks: idTasks,
    image: image,
    nameTask: nameTask,
    detail: detail,
    status: status,
    doDate: doDate,
    nameprinciple: nameprinciple,
    coin: coin,
    specialCoin: specialCoin,
  );

  factory MyMissionModel.fromJson(Map<String, dynamic> json) => MyMissionModel(
      idTasks: json["idTasks"],
      image: json["image"],
      nameTask: json["nameTask"],
      detail: json["detail"],
      status: json["status"],
      doDate: json["doDate"],
      nameprinciple: json["nameprinciple"],
      coin: json["coin"] == null ? null : Coin.fromJson(json["coin"]),
      specialCoin: json["specialCoin"] == null ? null : Coin.fromJson(json["specialCoin"]),
  );

  Map<String, dynamic> toJson() => {
    "idTasks": idTasks,
    "image": image,
    "nameTask" : nameTask,
    "detail" : detail,
    "status" : status,
    "doDate" : doDate,
    "nameprinciple" : nameprinciple,
    "coin": coin?.toJson(),
    "specialCoin": specialCoin?.toJson(),
  };
}