import 'dart:convert';

import 'package:unihr/feature/pocket/domain/entity/pocket_entity.dart';

List<PocketModel> PocketModelFromJson(String str) =>
    List<PocketModel>.from(json.decode(str).map((x) => PocketModel.fromJson(x)));

String MyactivityModelToJson(List<PocketModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PocketModel extends PocketEntity{
  PocketModel({
    required int? idEmployee,
    required int? heart,
    required int? coin,
    required int? unicorn,
    required int? pony,
    required int? fastmove,
    required int? doit,
    required int? caring,
    required int? centaur,
    required int? csr,
    required int? obsession,
    required int? outperform,
  }):super(
    idEmployee: idEmployee,
    heart: heart,
    coin: coin,
    unicorn: unicorn,
    pony: pony,
    fastmove: fastmove,
    doit: doit,
    caring: caring,
    centaur: centaur,
    csr: csr,
    obsession: obsession,
    outperform: outperform,
  );

  factory PocketModel.fromJson(Map<String, dynamic> json) => PocketModel(
    idEmployee: json["idEmployee"],
    heart: json["heart"],
    coin: json["coin"],
    unicorn: json["unicorn"],
    pony: json["pony"],
    fastmove: json["fastmove"],
    doit: json["doit"],
    caring: json["caring"],
    centaur: json["centaur"],
    csr: json["csr"],
    obsession: json["obsession"],
    outperform: json["outperform"],
  );

  Map<String, dynamic> toJson() => {
    "idEmployee": idEmployee,
    "heart": heart,
    "coin": coin,
    "unicorn": unicorn,
    "pony": pony,
    "fastmove": fastmove,
    "doit": doit,
    "caring": caring,
    "centaur": centaur,
    "csr": csr,
    "obsession": obsession,
    "outperform": outperform,

  };
}