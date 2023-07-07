import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';

import '../../model/feedback/feedback_model.dart';

abstract class Feedback_remote{
  Future<FeedbackModel> getReceiveFeedback();
}

class Feedback_remoteImpl implements Feedback_remote{
  final http.Client httpClient;

  Feedback_remoteImpl(this.httpClient);

  Future<FeedbackModel> getRecieveFeedback() async{
    final url = Uri.parse("https://uniculture-371814.as.r.appspot.com/api/feedback/10068989");
    final response = await httpClient.get(url,
      headers: {
        'Content-Type': 'application/json',
      }
    );
    if(response.statusCode ==200){
      return FeedbackModel.fromJson(json.decode(response.body));
    } else{
      throw ServerFailure();
    }
  }

  @override
  Future<FeedbackModel> getReceiveFeedback() {
    throw UnimplementedError();
  }
}