import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';

import '../../model/feedback_model.dart';

abstract class Feedback_remote{
  Future<List<FeedbackModel>> getRecieveFeedback();
  Future<List<FeedbackModel>> getSendedFeedback();
}

class Feedback_remoteImpl implements Feedback_remote {
  final http.Client httpClient;

  Feedback_remoteImpl(this.httpClient);

  @override
  Future<List<FeedbackModel>> getRecieveFeedback() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/feedback/10068989");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> feedbackJsonList = json.decode(response.body);
      final List<FeedbackModel> feedbackList = feedbackJsonList
          .map((feedbackJson) => FeedbackModel.fromJson(feedbackJson))
          .toList();
      return feedbackList;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<FeedbackModel>> getSendedFeedback() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/feedback/10068989");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> feedbackJsonList = json.decode(response.body);
      final List<FeedbackModel> feedbackList = feedbackJsonList
          .map((feedbackJson) => FeedbackModel.fromJson(feedbackJson))
          .toList();
      return feedbackList;
    } else {
      throw ServerFailure();
    }
  }
}