// To parse this JSON data, do
//
//     final feedbackEntity = feedbackEntityFromJson(jsonString);

import 'dart:convert';

class FeedbackEntity {
  int? idFeedback;
  DateTime? feedbackDate;
  String? feedbackType;
  String? feedback;
  int? idSender;
  int? idReceiver;
  String? senderFirstname;
  String? senderLastname;
  String? receiverFirstname;
  String? receiverLastname;

  FeedbackEntity({
    this.idFeedback,
    this.feedbackDate,
    this.feedbackType,
    this.feedback,
    this.idSender,
    this.idReceiver,
    this.senderFirstname,
    this.senderLastname,
    this.receiverFirstname,
    this.receiverLastname,
  });


}
