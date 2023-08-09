class CommunicateEntity {
  int idCommunication;
  String? type;
  String detail;
  dynamic file;
  String createDate;
  String? status;
  int? reward;
  String? rewardDate;
  int createBy;
  String firstName;
  String lastName;
  List<ReplyList>? replyList;
  List<LikeList>? likeList;

  CommunicateEntity({
    required this.idCommunication,
    required this.type,
    required this.detail,
    required this.file,
    required this.createDate,
    required this.status,
    required this.reward,
    required this.rewardDate,
    required this.createBy,
    required this.firstName,
    required this.lastName,
    required this.replyList,
    required this.likeList,
  });

}

class LikeList {
  int idCommunication;
  int idEmployee;

  LikeList({
    required this.idCommunication,
    required this.idEmployee,
  });

}

class ReplyList {
  int idCommunicationReply;
  DateTime replyDate;
  String reply;
  int idCommunication;

  ReplyList({
    required this.idCommunicationReply,
    required this.replyDate,
    required this.reply,
    required this.idCommunication,
  });

}
