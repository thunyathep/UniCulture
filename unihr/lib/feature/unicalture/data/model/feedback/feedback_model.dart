import 'dart:convert';

import '../../../domain/entities/feedback_entity.dart';


List<FeedbackModel> feedbackModelFromJson(String str) => List<FeedbackModel>.from(json.decode(str).map((x) => FeedbackModel.fromJson(x)));

String feedbackModelToJson(List<FeedbackModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class FeedbackModel extends FeedbackEntity {
  FeedbackModel({
    required idFeedback,
    required DateTime feedbackDate,
    required String feedbackType,
    required String feedback,
    required int idSender,
    required int idReceiver,
    required String senderFirstname,
    required String senderLastname,
    required String receiverFirstname,
    required String receiverLastname,
  }):super(
    idFeedback: idFeedback,
    feedbackDate: feedbackDate,
    feedbackType: feedbackType,
    feedback: feedback,
    idSender: idSender,
    idReceiver: idReceiver,
    senderFirstname: senderFirstname,
    senderLastname: senderLastname,
    receiverFirstname: receiverFirstname,
    receiverLastname: receiverLastname,
  );

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
      idFeedback: json["idFeedback"],
      feedbackDate: json["feedbackDate"],
      feedbackType: json["feedbackType"],
      feedback: json["feedback"],
      idSender: json["idSender"],
      idReceiver: json["idReceiver"],
      senderFirstname: json["senderFirstname"],
      senderLastname: json["senderLastname"],
      receiverFirstname: json["receiverFirstname"],
      receiverLastname: json["receiverLastname"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "idFeedback" : idFeedback,
    "feedbackDate" : feedbackDate,
    "feedbackType" : feedbackType,
    "feedback" : feedback,
    "idSender" : idSender,
    "idReceiver" : idReceiver,
    "senderFirstname" : senderFirstname,
    "senderLastname" : senderLastname,
    "receiverFirstname" : receiverFirstname,
    "receiverLastname" : receiverLastname,
  };
}