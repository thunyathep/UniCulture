import 'dart:convert';
import 'package:dartz/dartz_streaming.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/question/data/model/moralediary_model.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class MoraleDiary_Remote{
  Future<List<MoraleDiaryModel>> getMoraleDiary();
}

class MoraleDiary_remoteImpl implements MoraleDiary_Remote {
  final http.Client httpClient;

  MoraleDiary_remoteImpl(this.httpClient);

  @override
  Future<List<MoraleDiaryModel>> getMoraleDiary() async {
    final url = Uri.parse(
        // "https://uniculture-371814.as.r.appspot.com/api/morale-daily-user/${await LoginStorage.readEmployeeId()}"
        "https://uniculture-371814.as.r.appspot.com/api/morale-daily/1");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> moraleDiaryJsonList = json.decode(response.body);
      final List<MoraleDiaryModel> moraleDiaryList = moraleDiaryJsonList
          .map((moraleDiaryJson) => MoraleDiaryModel.fromJson(moraleDiaryJson))
          .toList();
      return moraleDiaryList;
    } else {
      throw ServerFailure();
    }
  }

}