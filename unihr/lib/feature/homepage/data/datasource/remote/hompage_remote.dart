import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/homepage/data/model/activity_model.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class Homepage_remote{
  Future<List<RewardModel>> getReward();
  Future<List<ActivityModel>> getActivity();
}

class Homepage_remoteIpml {
  final http.Client httpClient;

  Homepage_remoteIpml(this.httpClient);

  @override
  Future<List<RewardModel>> getReward() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/rewards/bestseller");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
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

  @override
  Future<List<ActivityModel>> getActivity() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-open/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> ActicityJsonList = json.decode(response.body);
      final List<ActivityModel> activitylist = ActicityJsonList
          .map((activityJson) => ActivityModel.fromJson(activityJson))
          .toList();
      return activitylist;
    } else {
      throw ServerFailure();
    }
  }
}