// To parse this JSON data, do
//
//     final rewardModel = rewardModelFromJson(jsonString);

import 'dart:convert';

import 'package:unihr/feature/score/domain/entity/score_entity.dart';


List<ScoreModel> ScoreModelFromJson(String str) =>
    List<ScoreModel>.from(json.decode(str).map((x) => ScoreModel.fromJson(x)));

String ScoreModelToJson(List<ScoreModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScoreModel extends ScoreEntity {
  ScoreModel({
    required int? idEmployee,
    required String? firstName,
    required String? lastName,
    required String? departmentShortName,
    required int? amount,
  }):super(
    idEmployee: idEmployee,
    firstName: firstName,
    lastName: lastName,
    departmentShortName: departmentShortName,
    amount: amount,
  );

  factory ScoreModel.fromJson(Map<String, dynamic> json) => ScoreModel(
    idEmployee: json["idEmployee"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    departmentShortName: json["departmentShortName"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "idEmployee": idEmployee,
    "firstName": firstName,
    "lastName": lastName,
    "departmentShortName": departmentShortName,
    "amount": amount,
  };
}