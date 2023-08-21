import 'dart:convert';

import '../../domain/entity/heart_recieve_year_entity.dart';

List<HeartYearModel> HeartYearModelFromJson(String str) =>
    List<HeartYearModel>.from(json.decode(str).map((x) => HeartYearModel.fromJson(x)));

String MyactivityModelToJson(List<HeartYearModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class HeartYearModel extends HeartRecieveYearEntity{
  HeartYearModel({
    required String? heartReceiveYear,
  }):super(
    heartReceiveYear: heartReceiveYear,
  );

  factory HeartYearModel.fromJson(Map<String, dynamic> json) => HeartYearModel(
    heartReceiveYear: json["heartReceiveYear"],
  );

  Map<String, dynamic> toJson() => {
    "heartReceiveYear": heartReceiveYear,
  };
}