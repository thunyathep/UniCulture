import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/score/data/model/score_model.dart';

import '../../../../../core/storage/secure_storage.dart';

abstract class Score_remote{
  Future<List<ScoreModel>> getHeartleaderboard();
  Future<List<ScoreModel>> getCoinleaderboard();
}

class Score_remoteImpl implements Score_remote {
  final http.Client httpClient;

  Score_remoteImpl(this.httpClient);

  @override
  Future<List<ScoreModel>> getHeartleaderboard() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/heart-leaderboard"
    );
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> heartJsonList = json.decode(response.body);
      final List<ScoreModel> heartLeader = heartJsonList
          .map((heartleaderJson) => ScoreModel.fromJson(heartleaderJson))
          .toList();
      return heartLeader;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<ScoreModel>> getCoinleaderboard() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/coin-leaderboard");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> coinJsonList = json.decode(response.body);
      final List<ScoreModel> coinLeader = coinJsonList
          .map((coinleaderJson) => ScoreModel.fromJson(coinleaderJson))
          .toList();
      return coinLeader;
    } else {
      throw ServerFailure();
    }
  }
}