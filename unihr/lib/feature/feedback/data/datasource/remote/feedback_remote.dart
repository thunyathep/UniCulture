import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';

import '../../../../../core/storage/secure_storage.dart';
import '../../model/feedback_model.dart';

abstract class Feedback_remote{
  Future<List<FeedbackModel>> getRecieveFeedback();
  Future<List<FeedbackModel>> getSendedFeedback();
  Future<void> sendFeedback(
      String feedback,
      String feedbackType,
      int idReceiver,
      int idSender,
      );
}

class Feedback_remoteImpl implements Feedback_remote {
  final http.Client httpClient;

  Feedback_remoteImpl(this.httpClient);

  @override
  Future<List<FeedbackModel>> getRecieveFeedback() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/feedback/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
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
          'x-access-token': '${await LoginStorage.readToken()}',
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
  Future<void> sendFeedback(
      String feedback,
      String feedbackType,
      int idReceiver,
      int idSender,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/feedback");
    final response = await httpClient.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        "feedback" : feedback,
        "feedbackType" : feedbackType,
        "idReceiver" : idReceiver,
        "idSender" : idSender,
      }
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log("Add FeedBack Success");
    } else {
      throw ServerFailure();
    }
  }
}