//
// import 'dart:convert';
//
// import 'package:unihr/feature/question/domain/entity/moralediary_entity.dart';
//
//
//
// List<MoraleDiaryModel> questionModelFromJson(String str) => List<MoraleDiaryModel>.from(json.decode(str).map((x) => MoraleDiaryModel.fromJson(x)));
//
// String moraleDiaryModelToJson(List<MoraleDiaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class MoraleDiaryModel extends MoraleDiaryEntity {
//   MoraleDiaryModel({
//     required int? idEmployee;
//     required String? status;
//     required String? question;
//     required String? questiontype;
//   }):super(
//     idEmployee: idEmployee,
//     status: status,
//     question : q
//   );
//
//   factory MoraleDiaryModel.fromJson(Map<String, dynamic> json) => MoraleDiaryModel(
//     idMoraleParticipant: json["idMoraleParticipant"],
//     idEmployee: json["idEmployee"],
//     idMorale: json["idMorale"],
//     status: json["status"],
//     moraleName: json["moraleName"],
//     startDate: DateTime.parse(json["startDate"]),
//     endDate: DateTime.parse(json["endDate"]),
//     moraleStatus: json["moraleStatus"],
//     moraleType: json["moraleType"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "idMoraleParticipant": idMoraleParticipant,
//     "idEmployee": idEmployee,
//     "idMorale": idMorale,
//     "status": status,
//     "moraleName": moraleName,
//     "startDate": startDate?.toIso8601String(),
//     "endDate": endDate?.toIso8601String(),
//     "moraleStatus": moraleStatus,
//     "moraleType": moraleType,
//     "questionTopic": List<dynamic>.from(questionTopic!.map((x) => x.toJson())),
//   };
// }
//
