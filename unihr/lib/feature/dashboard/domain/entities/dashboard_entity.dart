class DashboardEntity {
  int? idMorale;
  String? moraleName;
  DateTime? startDate;
  DateTime? endDate;
  String? moraleStatus;
  String? moraleType;
  List<MoraleResponse>? moraleResponse;
  List<MoraleDepAvgAndBest>? moraleDepAvgAndBest;
  List<MoraleTopicAvgAndBest>? moraleTopicAvgAndBest;

  DashboardEntity({
    this.idMorale,
    this.moraleName,
    this.startDate,
    this.endDate,
    this.moraleStatus,
    this.moraleType,
    this.moraleResponse,
    this.moraleDepAvgAndBest,
    this.moraleTopicAvgAndBest,
  });

  @override
  List<Object?> get prop => [];
}

class MoraleDepAvgAndBest {
  int? idDepartment;
  String? departmentShortName;
  double? average;
  String? bestRatio;

  MoraleDepAvgAndBest({
    this.idDepartment,
    this.departmentShortName,
    this.average,
    this.bestRatio,
  });

  factory MoraleDepAvgAndBest.fromJson(Map<String, dynamic> json) => MoraleDepAvgAndBest(
    idDepartment: json["idDepartment"],
    departmentShortName: json["departmentShortName"],
    average: json["average"]?.toDouble(),
    bestRatio: json["bestRatio"],
  );

  Map<String, dynamic> toJson() => {
    "idDepartment": idDepartment,
    "departmentShortName": departmentShortName,
    "average": average,
    "bestRatio": bestRatio,
  };
}

class MoraleResponse {
  String? department;
  int? participant;
  int? response;

  MoraleResponse({
    this.department,
    this.participant,
    this.response,
  });

  factory MoraleResponse.fromJson(Map<String, dynamic> json) => MoraleResponse(
    department: json["department"],
    participant: json["participant"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "department": department,
    "participant": participant,
    "response": response,
  };
}

class MoraleTopicAvgAndBest {
  int? idQuestionTopic;
  String? questionTopic;
  double? average;
  String? bestRatio;
  List<MoraleQuestion>? moraleQuestion;

  MoraleTopicAvgAndBest({
    this.idQuestionTopic,
    this.questionTopic,
    this.average,
    this.bestRatio,
    this.moraleQuestion,
  });

  factory MoraleTopicAvgAndBest.fromJson(Map<String, dynamic> json) => MoraleTopicAvgAndBest(
    idQuestionTopic: json["idQuestionTopic"],
    questionTopic: json["questionTopic"],
    average: json["average"]?.toDouble(),
    bestRatio: json["bestRatio"],
    moraleQuestion: json["moraleQuestion"] == null ? [] : List<MoraleQuestion>.from(json["moraleQuestion"]!.map((x) => MoraleQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idQuestionTopic": idQuestionTopic,
    "questionTopic": questionTopic,
    "average": average,
    "bestRatio": bestRatio,
    "moraleQuestion": moraleQuestion == null ? [] : List<dynamic>.from(moraleQuestion!.map((x) => x.toJson())),
  };
}

class MoraleQuestion {
  int? idQuestion;
  String? question;
  String? questionType;
  int? idMoraleQuestion;
  Score? score;
  List<QuestionFeedback>? questionFeedback;

  MoraleQuestion({
    this.idQuestion,
    this.question,
    this.questionType,
    this.idMoraleQuestion,
    this.score,
    this.questionFeedback,
  });

  factory MoraleQuestion.fromJson(Map<String, dynamic> json) => MoraleQuestion(
    idQuestion: json["idQuestion"],
    question: json["question"],
    questionType: json["questionType"],
    idMoraleQuestion: json["idMoraleQuestion"],
    score: json["score"] == null ? null : Score.fromJson(json["score"]),
    questionFeedback: json["questionFeedback"] == null ? [] : List<QuestionFeedback>.from(json["questionFeedback"]!.map((x) => QuestionFeedback.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idQuestion": idQuestion,
    "question": question,
    "questionType": questionType,
    "idMoraleQuestion": idMoraleQuestion,
    "score": score?.toJson(),
    "questionFeedback": questionFeedback == null ? [] : List<dynamic>.from(questionFeedback!.map((x) => x.toJson())),
  };
}

class QuestionFeedback {
  int? idMoraleQuestionFeedback;
  String? feedback;
  int? idQuestion;
  String? question;

  QuestionFeedback({
    this.idMoraleQuestionFeedback,
    this.feedback,
    this.idQuestion,
    this.question,
  });

  factory QuestionFeedback.fromJson(Map<String, dynamic> json) => QuestionFeedback(
    idMoraleQuestionFeedback: json["idMoraleQuestionFeedback"],
    feedback: json["feedback"],
    idQuestion: json["idQuestion"],
    question: json["question"],
  );

  Map<String, dynamic> toJson() => {
    "idMoraleQuestionFeedback": idMoraleQuestionFeedback,
    "feedback": feedback,
    "idQuestion": idQuestion,
    "question": question,
  };
}

class Score {
  int? idQuestion;
  int? idQuestionTopic;
  int? idMoraleQuestion;
  int? average;
  String? positivePerception;
  String? positiveHesitance;
  String? negativeHesitance;
  String? negitivePerception;

  Score({
    this.idQuestion,
    this.idQuestionTopic,
    this.idMoraleQuestion,
    this.average,
    this.positivePerception,
    this.positiveHesitance,
    this.negativeHesitance,
    this.negitivePerception,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    idQuestion: json["idQuestion"],
    idQuestionTopic: json["idQuestionTopic"],
    idMoraleQuestion: json["idMoraleQuestion"],
    average: json["average"],
    positivePerception: json["positivePerception"],
    positiveHesitance: json["positiveHesitance"],
    negativeHesitance: json["negativeHesitance"],
    negitivePerception: json["negitivePerception"],
  );

  Map<String, dynamic> toJson() => {
    "idQuestion": idQuestion,
    "idQuestionTopic": idQuestionTopic,
    "idMoraleQuestion": idMoraleQuestion,
    "average": average,
    "positivePerception": positivePerception,
    "positiveHesitance": positiveHesitance,
    "negativeHesitance": negativeHesitance,
    "negitivePerception": negitivePerception,
  };
}