import 'dart:convert';
import 'package:dartz/dartz_streaming.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/question/data/model/question_model.dart';

import '../../../../../core/storage/secure_storage.dart';

abstract class Question_remote{
  Future<List<QuestionModel>> getQuestion();
}

class Question_remoteImpl implements Question_remote {
  final http.Client httpClient;

  Question_remoteImpl(this.httpClient);

  @override
  Future<List<QuestionModel>> getQuestion() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/morale-user/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> questionJsonList = json.decode(response.body);
      final List<QuestionModel> questionList = questionJsonList
          .map((questionJson) => QuestionModel.fromJson(questionJson))
          .toList();
      return questionList;
    } else {
      throw ServerFailure();
    }
  }

}