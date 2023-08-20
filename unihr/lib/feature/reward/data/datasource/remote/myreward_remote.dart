import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/reward/data/model/myreward_model.dart';
import 'package:unihr/feature/reward/data/model/redeem_reward_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class MyReward_remote{
  Future<List<MyRewardModel>> getMyReward();
  Future<List<RedeemRewardModel>> getRedeemReward();
}

class MyReward_remoteImpl {
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
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
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
        "https://uniculture-371814.as.r.appspot.com/api/rewards");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
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
}