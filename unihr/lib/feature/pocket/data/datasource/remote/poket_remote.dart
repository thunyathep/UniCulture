import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:unihr/core/storage/secure_storage.dart';
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
        "https://uniculture-371814.as.r.appspot.com/api/user-coin/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
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