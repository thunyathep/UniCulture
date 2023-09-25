
import 'dart:convert';
import '../../domain/entities/threesixty_entity.dart';

List<ThreeSixtyModel> ThreeSixtyModelFromJson(String str) =>
    List<ThreeSixtyModel>.from(json.decode(str).map((x) => ThreeSixtyModel.fromJson(x)));

String ThreeSixtyModelToJson(List<ThreeSixtyModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThreeSixtyModel extends ThreeSixtyEntity {
  ThreeSixtyModel({
    required int? idAppraisee,
    required DateTime? startDate,
    required DateTime? endDate,
    required int? idAssessment,
    required int? idEmployee,
    required String? assessmentType,
    required String? assessmentName,
    required String? assessmentDescription,
    required int? scale,
    required String? firstName,
    required String? lastName,
    required String? position,
    required String? department,
    required List<SampleSize>? sampleSize,
    required List<QuestionList>? questionList,
  }):super(
    idAppraisee: idAppraisee,
    startDate: startDate,
    endDate: endDate,
    idAssessment: idAssessment,
    idEmployee: idEmployee,
    assessmentType: assessmentType,
    assessmentName: assessmentName,
    assessmentDescription: assessmentDescription,
    scale: scale,
    firstName: firstName,
    lastName: lastName,
    position: position,
    department: department,
    sampleSize: sampleSize,
    questionList: questionList,
  );

  factory ThreeSixtyModel.fromJson(Map<String, dynamic> json) => ThreeSixtyModel(
    idAppraisee: json["idAppraisee"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    idAssessment: json["idAssessment"],
    idEmployee: json["idEmployee"],
    assessmentType: json["assessmentType"],
    assessmentName: json["assessmentName"],
    assessmentDescription: json["assessmentDescription"],
    scale: json["scale"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    position: json["position"],
    department: json["department"],
    sampleSize: json["sampleSize"] == null ? [] : List<SampleSize>.from(json["sampleSize"]!.map((x) => SampleSize.fromJson(x))),
    questionList: json["questionList"] == null ? [] : List<QuestionList>.from(json["questionList"]!.map((x) => QuestionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idAppraisee": idAppraisee,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "idAssessment": idAssessment,
    "idEmployee": idEmployee,
    "assessmentType": assessmentType,
    "assessmentName": assessmentName,
    "assessmentDescription": assessmentDescription,
    "scale": scale,
    "firstName": firstName,
    "lastName": lastName,
    "position": position,
    "department": department,
    "sampleSize": sampleSize == null ? [] : List<dynamic>.from(sampleSize!.map((x) => x.toJson())),
    "questionList": questionList == null ? [] : List<dynamic>.from(questionList!.map((x) => x.toJson())),
  };
}