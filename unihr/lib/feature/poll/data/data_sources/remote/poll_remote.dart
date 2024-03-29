import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class Poll_remote{
  Future<List<Poll_Model>> getPoll();
  Future<void> sendPoll(
      int idEmployee,
      int idPoll,
      int idPollQuestion,
      );
}

class Poll_remoteImpl implements Poll_remote {
  final http.Client httpClient;

  Poll_remoteImpl(this.httpClient);

  @override
  Future<List<Poll_Model>> getPoll() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/poll/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> pollJsonList = json.decode(response.body);
      final List<Poll_Model> pollList = pollJsonList
          .map((questionJson) => Poll_Model.fromJson(questionJson))
          .toList();
      return pollList;
    } else {
      throw ServerFailure();
    }
  }


  @override
  Future<void> sendPoll(
      int idEmployee,
      int idPoll,
      int idPollQuestion,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/poll");
    final response = await httpClient.patch(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        "idEmployee" : idEmployee,
        "idPoll" : idPoll,
        "idPollQuestion" : idPollQuestion,
      }
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log("Add Poll Success");
    } else {
      throw ServerFailure();
    }
  }
}