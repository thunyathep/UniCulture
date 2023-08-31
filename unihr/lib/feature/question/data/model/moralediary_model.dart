
import 'dart:convert';

import 'package:unihr/feature/question/domain/entity/moralediary_entity.dart';



List<MoraleDiaryModel> moraleDiaryModelFromJson(String str) => List<MoraleDiaryModel>.from(json.decode(str).map((x) => MoraleDiaryModel.fromJson(x)));

String moraleDiaryModelToJson(List<MoraleDiaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoraleDiaryModel extends MoraleDiaryEntity {
  MoraleDiaryModel({
    required int? idMoraledaily,
    required int? reward,
    required String? question,
    required String? questiontype,
  }):super(
    idMoraledaily: idMoraledaily,
    reward: reward,
    question : question,
    questiontype: questiontype,
  );

  factory MoraleDiaryModel.fromJson(Map<String, dynamic> json) => MoraleDiaryModel(
    idMoraledaily: json["idMoraledaily"],
    reward: json["reward"],
    question: json["question"],
    questiontype: json["questiontype"],
  );

  Map<String, dynamic> toJson() => {
    "idMoraledaily" : idMoraledaily,
    "reward" : reward,
    "question" : question,
    "questiontype" : questiontype,
  };
}

