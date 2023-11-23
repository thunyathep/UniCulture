import 'dart:convert';

import '../../domain/entities/dashboard_entity.dart';


List<DashboardModel> dashboardModelFromJson(String str) => List<DashboardModel>.from(json.decode(str).map((x) => DashboardModel.fromJson(x)));

String dashboardModelToJson(List<DashboardModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashboardModel extends  DashboardEntity {
  final int idMorale;
  final String moraleName;
  final DateTime startDate;
  final DateTime endDate;
  final String moraleStatus;
  final String moraleType;

  DashboardModel({
    required this.idMorale,
    required this.moraleName,
    required this.startDate,
    required this.endDate,
    required this.moraleStatus,
    required this.moraleType,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    idMorale: json["idMorale"],
    moraleName: json["moraleName"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    moraleStatus: json["moraleStatus"],
    moraleType: json["moraleType"],
  );

  Map<String, dynamic> toJson() => {
    "idMorale": idMorale,
    "moraleName": moraleName,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "moraleStatus": moraleStatus,
    "moraleType": moraleType,
  };
}



List<DashboardFilterModel> dashboardFromJson(String str) => List<DashboardFilterModel>.from(json.decode(str).map((x) => DashboardFilterModel.fromJson(x)));

String dashboardFilterToJson(List<DashboardFilterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashboardFilterModel extends DashboardFilterEntity {
  DashboardFilterModel({
    required int idMorale,
    required String moraleName,
    required DateTime startDate,
    required DateTime endDate,
    required String moraleStatus,
    required String moraleType,
    required List<MoraleResponse> moraleResponse,
    required List<MoraleDepAvgAndBest> moraleDepAvgAndBest,
    required List<MoraleTopicAvgAndBest> moraleTopicAvgAndBest,
  }):super(
    idMorale : idMorale,
    moraleName : moraleName,
    startDate : startDate,
    endDate : endDate,
    moraleStatus: moraleStatus,
    moraleType : moraleType,
    moraleResponse : moraleResponse,
    moraleDepAvgAndBest : moraleDepAvgAndBest,
    moraleTopicAvgAndBest : moraleTopicAvgAndBest,
  );

  factory DashboardFilterModel.fromJson(Map<String, dynamic> json) => DashboardFilterModel(
    idMorale: json["idMorale"],
    moraleName: json["moraleName"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    moraleStatus: json["moraleStatus"],
    moraleType: json["moraleType"],
    moraleResponse: json["moraleResponse"] == null ? [] : List<MoraleResponse>.from(json["moraleResponse"]!.map((x) => MoraleResponse.fromJson(x))),
    moraleDepAvgAndBest: json["moraleDepAvgAndBest"] == null ? [] : List<MoraleDepAvgAndBest>.from(json["moraleDepAvgAndBest"]!.map((x) => MoraleDepAvgAndBest.fromJson(x))),
    moraleTopicAvgAndBest: json["moraleTopicAvgAndBest"] == null ? [] : List<MoraleTopicAvgAndBest>.from(json["moraleTopicAvgAndBest"]!.map((x) => MoraleTopicAvgAndBest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idMorale": idMorale,
    "moraleName": moraleName,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "moraleStatus": moraleStatus,
    "moraleType": moraleType,
    "moraleResponse": moraleResponse == null ? [] : List<dynamic>.from(moraleResponse!.map((x) => x.toJson())),
    "moraleDepAvgAndBest": moraleDepAvgAndBest == null ? [] : List<dynamic>.from(moraleDepAvgAndBest!.map((x) => x.toJson())),
    "moraleTopicAvgAndBest": moraleTopicAvgAndBest == null ? [] : List<dynamic>.from(moraleTopicAvgAndBest!.map((x) => x.toJson())),
  };

  @override
  List<Object> get prop => [];
}