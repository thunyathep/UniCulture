

class RewardEntity {
  int? idReward;
  String? name;
  String? detail;
  int? price;
  int? quantity;
  String? startDate;
  String? endDate;
  String? rewardManager;
  String? contact;
  String? location;
  String? image;
  // Coin? coin;
  // Coin? specialCoin;

  RewardEntity({
    this.idReward,
    this.name,
    this.detail,
    this.price,
    this.quantity,
    this.startDate,
    this.endDate,
    this.rewardManager,
    this.contact,
    this.location,
    this.image,
    // this.coin,
    // this.specialCoin,
  });

  @override
  List<Object?> get prop => [];
}

// class Coin {
//   int? idCoinType;
//   int? amount;
//   String? coinType;
//
//   Coin({
//     this.idCoinType,
//     this.amount,
//     this.coinType,
//   });
//
//   factory Coin.fromJson(Map<String, dynamic> json) => Coin(
//     idCoinType: json["idCoinType"],
//     amount: json["amount"],
//     coinType: json["coinType"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "idCoinType": idCoinType,
//     "amount": amount,
//     "coinType": coinType,
//   };
// }