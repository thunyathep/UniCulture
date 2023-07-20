import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/homepage/data/model/reward_model.dart';

import '../../../../../core/error/failure.dart';

abstract class Reward_remote{
  Future<List<RewardModel>> getReward();
}

class Reward_remoteIpml {
  final http.Client httpClient;

  Reward_remoteIpml(this.httpClient);

  @override
  Future<List<RewardModel>> getReward() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/rewards/bestseller");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> RewardJsonList = json.decode(response.body);
      final List<RewardModel> rewardlist = RewardJsonList
          .map((rewardJson) => RewardModel.fromJson(rewardJson))
          .toList();
      return rewardlist;
    } else {
      throw ServerFailure();
    }
  }
}