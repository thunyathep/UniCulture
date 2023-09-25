class ThreeSixtyEntity {
  int? idAppraisee;
  DateTime? startDate;
  DateTime? endDate;
  int? idAssessment;
  int? idEmployee;
  String? assessmentType;
  String? assessmentName;
  String? assessmentDescription;
  int? scale;
  String? firstName;
  String? lastName;
  String? position;
  String? department;
  List<SampleSize>? sampleSize;
  List<QuestionList>? questionList;

  ThreeSixtyEntity({
    this.idAppraisee,
    this.startDate,
    this.endDate,
    this.idAssessment,
    this.idEmployee,
    this.assessmentType,
    this.assessmentName,
    this.assessmentDescription,
    this.scale,
    this.firstName,
    this.lastName,
    this.position,
    this.department,
    this.sampleSize,
    this.questionList,
  });

  @override
  List<Object?> get prop => [];


}

class QuestionList {
  int? idAssessmentQuestion;
  String? question;

  QuestionList({
    this.idAssessmentQuestion,
    this.question,
  });

  factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
    idAssessmentQuestion: json["idAssessment_Question"],
    question: json["question"],
  );

  Map<String, dynamic> toJson() => {
    "idAssessment_Question": idAssessmentQuestion,
    "question": question,
  };
}

class SampleSize {
  int? idAppraiseeSampleSize;
  int? ratio;
  int? idSampleSize;
  int? idAppraiser;
  int? idAppraisee;
  String? status;
  String? sampleSizeName;
  String? firstName;
  String? lastName;
  String? position;
  String? department;
  List<AnswerList>? answerList;

  SampleSize({
    this.idAppraiseeSampleSize,
    this.ratio,
    this.idSampleSize,
    this.idAppraiser,
    this.idAppraisee,
    this.status,
    this.sampleSizeName,
    this.firstName,
    this.lastName,
    this.position,
    this.department,
    this.answerList,
  });

  factory SampleSize.fromJson(Map<String, dynamic> json) => SampleSize(
    idAppraiseeSampleSize: json["idAppraisee_SampleSize"],
    ratio: json["ratio"],
    idSampleSize: json["idSampleSize"],
    idAppraiser: json["idAppraiser"],
    idAppraisee: json["idAppraisee"],
    status: json["status"],
    sampleSizeName: json["sampleSizeName"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    position: json["position"],
    department: json["department"],
    answerList: json["answerList"] == null ? [] : List<AnswerList>.from(json["answerList"]!.map((x) => AnswerList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idAppraisee_SampleSize": idAppraiseeSampleSize,
    "ratio": ratio,
    "idSampleSize": idSampleSize,
    "idAppraiser": idAppraiser,
    "idAppraisee": idAppraisee,
    "status": status,
    "sampleSizeName": sampleSizeName,
    "firstName": firstName,
    "lastName": lastName,
    "position": position,
    "department": department,
    "answerList": answerList == null ? [] : List<dynamic>.from(answerList!.map((x) => x.toJson())),
  };
}

class AnswerList {
  int? idAssessmentAnswer;
  String? answer;
  int? idAssessmentQuestion;
  int? idAppraiseeSampleSize;

  AnswerList({
    this.idAssessmentAnswer,
    this.answer,
    this.idAssessmentQuestion,
    this.idAppraiseeSampleSize,
  });

  factory AnswerList.fromJson(Map<String, dynamic> json) => AnswerList(
    idAssessmentAnswer: json["idAssessment_Answer"],
    answer: json["answer"],
    idAssessmentQuestion: json["idAssessment_Question"],
    idAppraiseeSampleSize: json["idAppraisee_SampleSize"],
  );

  Map<String, dynamic> toJson() => {
    "idAssessment_Answer": idAssessmentAnswer,
    "answer": answer,
    "idAssessment_Question": idAssessmentQuestion,
    "idAppraisee_SampleSize": idAppraiseeSampleSize,
  };
}