class MyRewardEntity {
  int? idRedeem;
  String? redeemDate;
  int? redeemStatus;
  String? receivedDate;
  int? idReward;
  String? name;
  String? detail;
  String? image;
  CoinType? coin;
  CoinType? specialCoin;

  MyRewardEntity({
    this.idRedeem,
    this.redeemDate,
    this.redeemStatus,
    this.receivedDate,
    this.idReward,
    this.name,
    this.detail,
    this.image,
    this.coin,
    this.specialCoin,
  });

  @override
  List<Object?> get prop => [];

}

class CoinType {
  final int? idCoinType;
  final int? amount;
  final String? coinType;

  CoinType({
    this.idCoinType,
    this.amount,
    this.coinType,
  });

  factory CoinType.fromJson(Map<String, dynamic> json) => CoinType(
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
