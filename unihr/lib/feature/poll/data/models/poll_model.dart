
import 'dart:convert';

import '../../domain/entities/poll_entity.dart';


List<Poll_Model> Poll_ModelFromJson(String str) =>
    List<Poll_Model>.from(json.decode(str).map((x) => Poll_Model.fromJson(x)));

String Poll_ModelToJson(List<Poll_Model> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Poll_Model extends Poll_Entity {
  Poll_Model({
    required int? idPoll,
    required String? poll,
    required DateTime? endDate,
    required String? status,
    required List<QuestionPollList>? questionPollList,
    required List<VoterList>? voterList,
  }):super(
    idPoll: idPoll,
  );

  factory Poll_Model.fromJson(Map<String, dynamic> json) => Poll_Model(
    idPoll: json["idPoll"],
    poll: json["poll"],
    endDate: DateTime.parse(json["endDate"]),
    status: json["status"],
    questionPollList: json["questionList"] == null ? [] : List<QuestionPollList>.from(json["questionList"]!.map((x) => QuestionPollList.fromJson(x))),
    voterList: List<VoterList>.from(json["voterList"].map((x) => VoterList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idPoll": idPoll,
    "poll": poll,
    "endDate": endDate!.toIso8601String(),
    "status": status,
    "questionList": List<dynamic>.from(questionPollList!.map((x) => x.toJson())),
    "voterList": List<dynamic>.from(voterList!.map((x) => x.toJson())),
  };
}