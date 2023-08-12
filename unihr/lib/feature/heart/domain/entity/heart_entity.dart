class HeartTransferEntity {
  int? idHeartTransfer;
  String? transferDate;
  int? value;
  int? idSender;
  int? idReceiver;
  String? detail;
  String? reply;
  String? senderFirstname;
  String? senderLastname;
  String? receiverFirstname;
  String? receiverLastname;

  HeartTransferEntity({
      this.idHeartTransfer,
      this.transferDate,
      this.value,
      this.idSender,
      this.idReceiver,
      this.detail,
      this.reply,
      this.senderFirstname,
      this.senderLastname,
      this.receiverFirstname,
      this.receiverLastname
  });

  @override
  List<Object?> get prop => [];
}