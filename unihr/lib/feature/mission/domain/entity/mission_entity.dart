class MissionEntity {
  int? idTasks;
  String? status;
  String? doDate;
  String? nameTask;
  String? detail;
  String? nameprinciple;
  Coin? coin;
  Coin? specialCoin;

  MissionEntity({
    this.idTasks,
    this.status,
    this.doDate,
    this.nameTask,
    this.detail,
    this.nameprinciple,
    this.coin,
    this.specialCoin,
  });
  @override
  List<Object?> get prop => [];
}

class Coin {
  final int? idCoinType;
  final int? amount;
  final String? coinType;

  Coin({
    this.idCoinType,
    this.amount,
    this.coinType,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    idCoinType: json["idCoinType"],
    amount: json["amount"],
    coinType: json["coinType"],
  );

  Map<String, dynamic> toJson() => {
    "idCoinType": idCoinType,
    "amount": amount,
    "coinType": coinType,
  };
}