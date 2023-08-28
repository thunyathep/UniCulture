class QuestionEntity {
  final int? idMoraleParticipant;
  final int? idEmployee;
  final int? idMorale;
  final String? status;
  final String? moraleName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? moraleStatus;
  final String? moraleType;
  final List<QuestionTopic>? questionTopic;

  QuestionEntity({
    this.idMoraleParticipant,
    this.idEmployee,
    this.idMorale,
    this.status,
    this.moraleName,
    this.startDate,
    this.endDate,
    this.moraleStatus,
    this.moraleType,
    this.questionTopic,
  });

  @override
  List<Object?> get prop => [];
}

class QuestionTopic {
  final int? idQuestionTopic;
  final String? questionTopic;
  final List<QuestionList>? questionList;

  QuestionTopic({
    this.idQuestionTopic,
    this.questionTopic,
    this.questionList,
  });
  Map<String, dynamic> toJson() => {
    "idQuestionTopic": idQuestionTopic,
    "questionTopic": questionTopic,
    "questionList": List<dynamic>.from(questionList!.map((x) => x.toJson())),
  };
}

class QuestionList {
  final int? idQuestion;
  final String? question;
  final String? questionType;
  final int? idMoraleQuestion;

  QuestionList({
    this.idQuestion,
    this.question,
    this.questionType,
    this.idMoraleQuestion,
  });


  Map<String, dynamic> toJson() => {
    "idQuestion": idQuestion,
    "question": question,
    "questionType": questionType,
    "idMoraleQuestion": idMoraleQuestion,
  };
}