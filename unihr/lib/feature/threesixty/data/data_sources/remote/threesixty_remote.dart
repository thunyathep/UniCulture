import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/reward/data/model/myreward_model.dart';
import 'package:unihr/feature/reward/data/model/redeem_reward_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../domain/entities/threesixty_entity.dart';
import '../../models/threesixty_model.dart';

abstract class ThreeSixty_remote{
  Future<List<ThreeSixtyModel>> getQuestionThreeSixty();
  Future<void> AnswerQuestionThreeSixty(
      List<AnswerQuestionToJson> answer,
      );
}

class ThreeSixty_remoteImpl implements ThreeSixty_remote{
  final http.Client httpClient;

  ThreeSixty_remoteImpl(this.httpClient);

  @override
  Future<List<ThreeSixtyModel>> getQuestionThreeSixty() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/appraisee-user/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> QuestionJsonList = json.decode(response.body);
      final List<ThreeSixtyModel> ThreeSixtyQuestionlist = QuestionJsonList
          .map((questionJson) => ThreeSixtyModel.fromJson(questionJson))
          .toList();
      return ThreeSixtyQuestionlist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> AnswerQuestionThreeSixty(
      List<AnswerQuestionToJson> answerList,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/appraisee-answer");
    final response = await httpClient.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode(
        answerList
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      log("Answer ThreeSixty Success");
    } else {
      log("Answer ThreeSixty UnSuccess");
      throw ServerFailure();
    }
  }
}