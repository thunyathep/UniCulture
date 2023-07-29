import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/pocket/data/model/pocket_model.dart';

import '../../../../../core/error/failure.dart';

abstract class Pocket_remote{
  Future<List<PocketModel>> getPocket();
}

class Pocket_remoteImpl{
  final http.Client httpClient;

  Pocket_remoteImpl(this.httpClient);

  @override
  Future<List<PocketModel>> getPocket() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/user-coin/10068989");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> PocketJsonList = json.decode(response.body);
      final List<PocketModel> pocketlist = PocketJsonList
          .map((activityJson) => PocketModel.fromJson(activityJson))
          .toList();
      return pocketlist;
    } else {
      throw ServerFailure();
    }
  }

}