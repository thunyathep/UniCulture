import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/reward/data/model/myreward_model.dart';
import 'package:unihr/feature/reward/data/model/redeem_reward_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../domain/entity/redeem_reward_entity.dart';

abstract class MyReward_remote{
  Future<List<MyRewardModel>> getMyReward();
  Future<List<RedeemRewardModel>> getRedeemReward();
  Future<List<RedeemRewardModel>> getRedeemRewardHomePage();
  Future<void> redeemedReward(
      List<CoinRedeem> coins,
      int idEmployee,
      int quantity,
      );
}

class MyReward_remoteImpl implements MyReward_remote {
  final http.Client httpClient;

  MyReward_remoteImpl(this.httpClient);

  @override
  Future<List<MyRewardModel>> getMyReward() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/my-redeem-reward/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> RewardJsonList = json.decode(response.body);
      final List<MyRewardModel> myrewardlist = RewardJsonList
          .map((rewardJson) => MyRewardModel.fromJson(rewardJson))
          .toList();
      return myrewardlist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<RedeemRewardModel>> getRedeemReward() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/reward-active/100");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> RedeemRewardJsonList = json.decode(response.body);
      final List<RedeemRewardModel> redeemrewardlist = RedeemRewardJsonList
          .map((rewardJson) => RedeemRewardModel.fromJson(rewardJson))
          .toList();
      return redeemrewardlist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<RedeemRewardModel>> getRedeemRewardHomePage() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/reward/100");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> RedeemRewardJsonList = json.decode(response.body);
      final List<RedeemRewardModel> redeemrewardlist = RedeemRewardJsonList
          .map((rewardJson) => RedeemRewardModel.fromJson(rewardJson))
          .toList();
      return redeemrewardlist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> redeemedReward(
      List<CoinRedeem> coins,
      int idEmployee,
      int quantity,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/redeem-transaction");
    final response = await httpClient.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        coins,
        idEmployee,
        quantity,
      }
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log("Redeem Reward Success");
    } else {
      throw ServerFailure();
    }
  }
}