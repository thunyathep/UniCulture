import 'dart:convert';

import 'package:unihr/feature/heart/domain/entity/heart_entity.dart';


List<HeartTransferModel> heartTransferModelFromJson(String str) =>
    List<HeartTransferModel>.from(json.decode(str).map((x) => HeartTransferModel.fromJson(x)));

String heartTransferModelToJson(List<HeartTransferModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeartTransferModel extends HeartTransferEntity {
  HeartTransferModel({
    required int? idHeartTransfer,
    required String? transferDate,
    required int? value,
    required int? idSender,
    required int? idReceiver,
    required String? detail,
    required String? reply,
    required String? senderFirstname,
    required String? senderLastname,
    required String? receiverFirstname,
    required String? receiverLastname,
  }):super(
    idHeartTransfer: idHeartTransfer,
    transferDate: transferDate,
    value: value,
    idSender: idSender,
    idReceiver: idReceiver,
    detail: detail,
    reply: reply,
    senderFirstname: senderFirstname,
    senderLastname: senderLastname,
    receiverFirstname: receiverFirstname,
    receiverLastname: receiverLastname,
  );

  factory HeartTransferModel.fromJson(Map<String, dynamic> json) => HeartTransferModel(
    idHeartTransfer: json["idHeartTransfer"],
    transferDate: json["transferDate"],
    value: json["value"],
    idSender: json["idSender"],
    idReceiver: json["idReceiver"],
    detail: json["detail"],
    reply: json["reply"],
    senderFirstname: json["senderFirstname"],
    senderLastname: json["senderLastname"],
    receiverFirstname: json["receiverFirstname"],
    receiverLastname: json["receiverLastname"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "idHeartTransfer" : idHeartTransfer,
    "transferDate" : transferDate,
    "value" : value,
    "idSender" : idSender,
    "idReceiver" : idReceiver,
    "detail" : detail,
    "reply" : reply,
    "senderFirstname" : senderFirstname,
    "senderLastname" : senderLastname,
    "receiverFirstname" : receiverFirstname,
    "receiverLastname" : receiverLastname,
  };

  @override
  List<Object> get prop => [];
}