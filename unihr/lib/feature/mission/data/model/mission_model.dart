import 'dart:convert';

import '../../domain/entity/mission_entity.dart';

List<MyMissionModel> MyMissionModelFromJson(String str) =>
    List<MyMissionModel>.from(json.decode(str).map((x) => MyMissionModel.fromJson(x)));

String MyMissionModelToJson(List<MyMissionModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyMissionModel extends MissionEntity{
  MyMissionModel({
    required int? idMission,
    required DateTime? missionDate,
    required int? reward,
    required String? missionTitle,
    required String? missionDetail,
    required String? detail,
    required String? keyLearning,
    required String? file,
    required int? idEmployee,
    required int? createBy,
    required int? idMissionStatus,
    required DateTime? rewardDate,
    required String? missionStatus,
}) :super(
    idMission: idMission,
    missionDate: missionDate,
    reward: reward,
    missionTitle: missionTitle,
    missionDetail: missionDetail,
    detail: detail,
    keyLearning: keyLearning,
    file: file,
    idEmployee: idEmployee,
    createBy: createBy,
    idMissionStatus: idMissionStatus,
    rewardDate: rewardDate,
    missionStatus: missionStatus,
  );

  factory MyMissionModel.fromJson(Map<String, dynamic> json) => MyMissionModel(
    idMission: json["idMission"],
    missionDate: json["missionDate"] == null ? null : DateTime.parse(json["missionDate"]),
    reward: json["reward"],
    missionTitle: json["missionTitle"],
    missionDetail: json["missionDetail"],
    detail: json["detail"],
    keyLearning: json["keyLearning"],
    file: json["file"],
    idEmployee: json["idEmployee"],
    createBy: json["createBy"],
    idMissionStatus: json["idMissionStatus"],
    rewardDate: json["rewardDate"] == null ? null : DateTime.parse(json["rewardDate"]),
    missionStatus: json["missionStatus"],
  );

  Map<String, dynamic> toJson() => {
    "idMission": idMission,
    "missionDate": missionDate?.toIso8601String(),
    "reward": reward,
    "missionTitle": missionTitle,
    "missionDetail": missionDetail,
    "detail": detail,
    "keyLearning": keyLearning,
    "file": file,
    "idEmployee": idEmployee,
    "createBy": createBy,
    "idMissionStatus": idMissionStatus,
    "rewardDate": rewardDate?.toIso8601String(),
    "missionStatus": missionStatus,
  };
}