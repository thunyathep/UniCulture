class RedeemRewardEntity {
  int? idCompanyReward;
  String? name;
  String? detail;
  String? image;
  String? rewardManager;
  String? contact;
  dynamic location;
  int? idRewardType;
  List<Item>? items;
  List<Images>? images;
  List<ThreeSixtyModelOption>? options;
  int? idUniReward;

  RedeemRewardEntity({
    this.idCompanyReward,
    this.name,
    this.detail,
    this.image,
    this.rewardManager,
    this.contact,
    this.location,
    this.idRewardType,
    this.items,
    this.images,
    this.options,
    this.idUniReward,
  });

  @override
  List<Object?> get prop => [];
}

class Images {
  int? idUniRewardImage;
  String? image;

  Images({
    this.idUniRewardImage,
    this.image,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    idUniRewardImage: json["idUniRewardImage"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "idUniRewardImage": idUniRewardImage,
    "image": image,
  };
}

class Item {
  int? quantity;
  int? active;
  int? idRewardGroup;
  int? idCompanyRewardItem;
  String? sku;
  int? price;
  String? image;
  int? numberOfRedeem;
  List<CoinRedeem>? coins;
  List<ItemOption>? options;
  int? idUniRewardItem;

  Item({
    this.quantity,
    this.active,
    this.idRewardGroup,
    this.idCompanyRewardItem,
    this.sku,
    this.price,
    this.image,
    this.numberOfRedeem,
    this.coins,
    this.options,
    this.idUniRewardItem,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    quantity: json["quantity"],
    active: json["active"],
    idRewardGroup: json["idRewardGroup"],
    idCompanyRewardItem: json["idCompanyRewardItem"],
    sku: json["sku"],
    price: json["price"],
    image: json["image"],
    numberOfRedeem: json["numberOfRedeem"],
    coins: json["coins"] == null ? [] : List<CoinRedeem>.from(json["coins"]!.map((x) => CoinRedeem.fromJson(x))),
    options: json["options"] == null ? [] : List<ItemOption>.from(json["options"]!.map((x) => ItemOption.fromJson(x))),
    idUniRewardItem: json["idUniRewardItem"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "active": active,
    "idRewardGroup": idRewardGroup,
    "idCompanyRewardItem": idCompanyRewardItem,
    "sku": sku,
    "price": price,
    "image": image,
    "numberOfRedeem": numberOfRedeem,
    "coins": coins == null ? [] : List<dynamic>.from(coins!.map((x) => x.toJson())),
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "idUniRewardItem": idUniRewardItem,
  };
}

class CoinRedeem {
  int? amount;
  int? idCoinType;
  String? coinType;

  CoinRedeem({
    this.amount,
    this.idCoinType,
    this.coinType,
  });

  factory CoinRedeem.fromJson(Map<String, dynamic> json) => CoinRedeem(
    amount: json["amount"],
    idCoinType: json["idCoinType"],
    coinType: json["coinType"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "idCoinType": idCoinType,
    "coinType": coinType,
  };
}

class ItemOption {
  int? idVariationOption;
  String? value;
  int? idVariation;

  ItemOption({
    this.idVariationOption,
    this.value,
    this.idVariation,
  });

  factory ItemOption.fromJson(Map<String, dynamic> json) => ItemOption(
    idVariationOption: json["idVariationOption"],
    value: json["value"],
    idVariation: json["idVariation"],
  );

  Map<String, dynamic> toJson() => {
    "idVariationOption": idVariationOption,
    "value": value,
    "idVariation": idVariation,
  };
}

class ThreeSixtyModelOption {
  int? idVariation;
  String? name;
  List<OptionOption>? option;

  ThreeSixtyModelOption({
    this.idVariation,
    this.name,
    this.option,
  });

  factory ThreeSixtyModelOption.fromJson(Map<String, dynamic> json) => ThreeSixtyModelOption(
    idVariation: json["idVariation"],
    name: json["name"],
    option: json["option"] == null ? [] : List<OptionOption>.from(json["option"]!.map((x) => OptionOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "idVariation": idVariation,
    "name": name,
    "option": option == null ? [] : List<dynamic>.from(option!.map((x) => x.toJson())),
  };
}

class OptionOption {
  int? idVariationOption;
  String? value;

  OptionOption({
    this.idVariationOption,
    this.value,
  });

  factory OptionOption.fromJson(Map<String, dynamic> json) => OptionOption(
    idVariationOption: json["idVariationOption"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "idVariationOption": idVariationOption,
    "value": value,
  };
}