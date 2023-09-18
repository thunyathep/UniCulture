import 'dart:convert';

import 'package:unihr/feature/pocket/domain/entity/pocket_entity.dart';

List<PocketModel> PocketModelFromJson(String str) =>
    List<PocketModel>.from(json.decode(str).map((x) => PocketModel.fromJson(x)));

String MyactivityModelToJson(List<PocketModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PocketModel extends PocketEntity{
  PocketModel({
    required int? idEmployee,
    required int? idCoinType,
    required int? amount,
  }):super(
    idEmployee: idEmployee,
    idCoinType: idCoinType,
    amount: amount,
  );

  factory PocketModel.fromJson(Map<String, dynamic> json) => PocketModel(
    idEmployee: json["idEmployee"],
    idCoinType: json["idCoinType"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "idEmployee": idEmployee,
    "idCoinType" : idCoinType,
    "amount" : amount,
  };
}