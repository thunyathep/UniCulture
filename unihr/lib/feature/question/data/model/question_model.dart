
import 'dart:convert';

import '../../domain/entity/question_entity.dart';


List<QuestionModel> questionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required int? idMoraleParticipant,
    required int? idEmployee,
    required int? idMorale,
    required String? status,
    required String? moraleName,
    required DateTime? startDate,
    required DateTime? endDate,
    required String? moraleStatus,
    required String? moraleType,
    required List<QuestionTopic>? questionTopic,
  }):super(
    idMoraleParticipant: idMoraleParticipant,
    idEmployee: idEmployee,
    idMorale: idMorale,
    status: status,
    moraleName: moraleName,
    startDate: startDate,
    endDate: endDate,
    moraleStatus: moraleStatus,
    moraleType: moraleType,
    questionTopic: questionTopic,
  );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    idMoraleParticipant: json["idMoraleParticipant"],
    idEmployee: json["idEmployee"],
    idMorale: json["idMorale"],
    status: json["status"],
    moraleName: json["moraleName"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    moraleStatus: json["moraleStatus"],
    moraleType: json["moraleType"],
    questionTopic: List<QuestionTopic>.from(json["questionTopic"].map((x) => QuestionTopicModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idMoraleParticipant": idMoraleParticipant,
    "idEmployee": idEmployee,
    "idMorale": idMorale,
    "status": status,
    "moraleName": moraleName,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "moraleStatus": moraleStatus,
    "moraleType": moraleType,
    "questionTopic": List<dynamic>.from(questionTopic!.map((x) => x.toJson())),
  };
}

class QuestionTopicModel extends QuestionTopic{
  QuestionTopicModel({
    required int idQuestionTopic,
    required String questionTopic,
    required List<QuestionList> questionList,
  }):super(
    idQuestionTopic: idQuestionTopic,
    questionTopic: questionTopic,
    questionList: questionList,
  );

  factory QuestionTopicModel.fromJson(Map<String, dynamic> json) => QuestionTopicModel(
    idQuestionTopic: json["idQuestionTopic"],
    questionTopic: json["questionTopic"],
    questionList: List<QuestionList>.from(json["questionList"].map((x) => QuestionListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idQuestionTopic": idQuestionTopic,
    "questionTopic": questionTopic,
    "questionList": List<dynamic>.from(questionList!.map((x) => x.toJson())),
  };
}

class QuestionListModel extends QuestionList {
  QuestionListModel({
    required int? idQuestion,
    required String? question,
    required String? questionType,
    required int? idMoraleQuestion,
  }):super(
    idQuestion: idQuestion,
    question: question,
    questionType: questionType,
    idMoraleQuestion: idMoraleQuestion,
  );

  factory QuestionListModel.fromJson(Map<String, dynamic> json) => QuestionListModel(
    idQuestion: json["idQuestion"],
    question: json["question"],
    questionType: json["questionType"],
    idMoraleQuestion: json["idMoraleQuestion"],
  );

  Map<String, dynamic> toJson() => {
    "idQuestion": idQuestion,
    "question": question,
    "questionType": questionType,
    "idMoraleQuestion": idMoraleQuestion,
  };
}
