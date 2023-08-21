import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:unihr/core/storage/secure_storage.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';

import '../../../../../core/error/failure.dart';

abstract class HeartYear_Remote{
  Future<List<HeartYearModel>> getHeartYear();
}

class HeartYear_RemoteImpl{
  final http.Client httpClient;

  HeartYear_RemoteImpl(this.httpClient);

  @override
  Future<List<HeartYearModel>> getHeartYear() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/heart-receive-year/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );

    if (response.statusCode == 200) {
      final List<dynamic> HeartYearJsonList = json.decode(response.body);
      final List<HeartYearModel> heartyearlist = HeartYearJsonList
          .map((heartyearJson) => HeartYearModel.fromJson(heartyearJson))
          .toList();
      return heartyearlist;
    } else {
      throw ServerFailure();
    }
  }

}