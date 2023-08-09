import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/communicate/data/model/communicate_model.dart';
import '../../../../../core/error/failure.dart';

abstract class Communicate_remote{
  Future<List<CommunicateModel>> getCommunicate();
}

class Communicate_remoteImpl{
  final http.Client httpClient;

  Communicate_remoteImpl(this.httpClient);

  @override
  Future<List<CommunicateModel>> getCommunicate() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/communication");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> CommunicateJsonList = json.decode(response.body);
      final List<CommunicateModel> commulist = CommunicateJsonList
          .map((commuJson) => CommunicateModel.fromJson(commuJson))
          .toList();
      return commulist;
    } else {
      throw ServerFailure();
    }
  }

}