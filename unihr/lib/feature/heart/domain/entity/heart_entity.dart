class HeartTransferEntity {
  int? idHeartTransfer;
  String? transferDate;
  int? value;
  int? idSender;
  int? idReceiver;
  String? detail;
  String? reply;
  String? senderfirstname;
  String? senderlastname;
  String? receiverfirstname;
  String? receiverlastname;

  HeartTransferEntity({
      this.idHeartTransfer,
      this.transferDate,
      this.value,
      this.idSender,
      this.idReceiver,
      this.detail,
      this.reply,
      this.senderfirstname,
      this.senderlastname,
      this.receiverfirstname,
      this.receiverlastname
  });

  @override
  List<Object?> get prop => [];
}