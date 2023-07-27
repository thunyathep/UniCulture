class AllActivityEntity {
  int? idActivity;
  String? activityType;
  String? name;
  String? detail;
  String? location;
  String? startDate;
  String? endDate;
  String? openRegisterDate;
  String? closeRegisterDate;
  String? organizer;
  String? contact;
  String? image;
  int? idActivityStatus;
  String? status;
  int? idEmployee;
  int? participantStatus;
  Coin? coin;
  Coin? specialCoin;

  AllActivityEntity({
    this.idActivity,
    this.activityType,
    this.name,
    this.detail,
    this.location,
    this.startDate,
    this.endDate,
    this.openRegisterDate,
    this.closeRegisterDate,
    this.organizer,
    this.contact,
    this.image,
    this.idActivityStatus,
    this.status,
    this.idEmployee,
    this.participantStatus,
    this.coin,
    this.specialCoin
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