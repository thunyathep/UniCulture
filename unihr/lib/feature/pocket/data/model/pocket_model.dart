import 'dart:convert';

import 'package:unihr/feature/pocket/domain/entity/pocket_entity.dart';

List<PocketModel> PocketModelFromJson(String str) =>
    List<PocketModel>.from(json.decode(str).map((x) => PocketModel.fromJson(x)));

String MyactivityModelToJson(List<PocketModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PocketModel extends PocketEntity{
  PocketModel({
    required int? idCoinType,
    required String? coinType,
    required int? amount,
  }):super(
    idCoinType: idCoinType,
    coinType: coinType,
    amount: amount,
  );

  factory PocketModel.fromJson(Map<String, dynamic> json) => PocketModel(
    idCoinType: json["idCoinType"],
    coinType: json["coinType"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "idCoinType" : idCoinType,
    "coinType" : coinType,
    "amount" : amount,
  };
}