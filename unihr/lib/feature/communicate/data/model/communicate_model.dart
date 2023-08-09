import 'dart:convert';

import 'package:unihr/feature/communicate/domain/entity/communicate_entity.dart';

List<CommunicateModel> CommunityModelFromJson(String str) =>
    List<CommunicateModel>.from(json.decode(str).map((x) => CommunicateModel.fromJson(x)));

String CommunityModelToJson(List<CommunicateModel> data)
=> json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommunicateModel extends CommunicateEntity{
  CommunicateModel({
    required int idCommunication,
    required String? type,
    required String detail,
    required dynamic file,
    required String createDate,
    required String? status,
    required int? reward,
    required String? rewardDate,
    required int createBy,
    required String firstName,
    required String lastName,
    required List<ReplyList>? replyList,
    required List<LikeList>? likeList,
}):super(
    idCommunication: idCommunication,
    type: type,
    detail: detail,
    file: file,
    createDate: createDate,
    status: status,
    reward: reward,
    rewardDate: rewardDate,
    createBy: createBy,
    firstName: firstName,
    lastName: lastName,
    replyList: replyList,
    likeList: likeList,
  );

  factory CommunicateModel.fromJson(Map<String, dynamic> json) => CommunicateModel(
      idCommunication: json["idCommunication"],
      type: json["type"],
      detail: json["detail"],
      file: json["file"],
      createDate: json["createDate"],
      status: json["status"],
      reward: json["reward"],
      rewardDate: json["rewardDate"],
      createBy: json["createBy"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      replyList: json["replyList"] == null ? [] :
        List<ReplyList>.from(json["reply"]!.map((x) =>
            ReplyListModel.fromJson(x))),
      likeList: json["likeList"] == null ? [] :
        List<LikeList>.from(json["like"]!.map((x) =>
            LikeListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() =>{
    "idCommunication" : idCommunication,
    "type" : type,
    "detail" : detail,
    "file" : file,
    "createDate" : createDate,
    "status" : status,
    "reward" : reward,
    "rewardDate" : rewardDate,
    "createBy" : createBy,
    "firstName" : firstName,
    "lastName" : lastName,
    "replyList" : replyList,
    "likeList" : likeList,
  };
}

class ReplyListModel extends ReplyList{
  ReplyListModel({
    required int idCommunicationReply,
    required DateTime replyDate,
    required String reply,
    required int idCommunication,
  }):super(
    idCommunicationReply: idCommunicationReply,
    replyDate: replyDate,
    reply: reply,
    idCommunication: idCommunication,
  );

  factory ReplyListModel.fromJson(Map<String, dynamic> json) => ReplyListModel(
      idCommunicationReply: json["idCommunicationReply"],
      replyDate: json["replyDate"],
      reply: json["reply"],
      idCommunication: json["idCommunication"],
  );
}

class LikeListModel extends LikeList{
  LikeListModel({
    required int idCommunication,
    required int idEmployee,
  }):super(
    idCommunication: idCommunication,
    idEmployee: idEmployee,
  );

  factory LikeListModel.fromJson(Map<String, dynamic> json ) => LikeListModel(
      idCommunication: json["idCommunication"],
      idEmployee: json["idEmployee"],
  );
}