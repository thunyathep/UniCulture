import 'dart:convert';

class Poll_Entity {
  int? idPoll;
  String? poll;
  DateTime? endDate;
  String? status;
  List<QuestionPollList>? questionPollList;
  List<VoterList>? voterList;

  Poll_Entity({
    this.idPoll,
    this.poll,
    this.endDate,
    this.status,
    this.questionPollList,
    this.voterList,
  });
}

class QuestionPollList {
  final int? idPollQuestion;
  final String? question;
  final int? score;

  QuestionPollList({
    this.idPollQuestion,
    this.question,
    this.score,
  });

  factory QuestionPollList.fromJson(Map<String, dynamic> json) => QuestionPollList(
    idPollQuestion: json["idPollQuestion"],
    question: json["question"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "idPollQuestion": idPollQuestion,
    "question": question,
    "score": score,
  };
}

class VoterList {
  final int? idPoll;
  final int? idPollQuestion;
  final int? idEmployee;

  VoterList({
    this.idPoll,
    this.idPollQuestion,
    this.idEmployee,
  });

  factory VoterList.fromJson(Map<String, dynamic> json) => VoterList(
    idPoll: json["idPoll"],
    idPollQuestion: json["idPollQuestion"],
    idEmployee: json["idEmployee"],
  );

  Map<String, dynamic> toJson() => {
    "idPoll": idPoll,
    "idPollQuestion": idPollQuestion,
    "idEmployee": idEmployee,
  };
}
