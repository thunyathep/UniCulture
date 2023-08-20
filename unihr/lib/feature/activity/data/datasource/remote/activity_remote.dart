import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class Activity_remote{
  Future<List<MyActivityModel>> getMyActivity();
  Future<List<AllActivityModel>> getAllActivity();
  Future<List<AllActivityModel>> getHomePageActivity();

}

class Activity_remoteImpl{
  final http.Client httpClient;

  Activity_remoteImpl(this.httpClient);

  @override
  Future<List<MyActivityModel>> getMyActivity() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-register/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> ActivityJsonList = json.decode(response.body);
      final List<MyActivityModel> myactivitylist = ActivityJsonList
          .map((activityJson) => MyActivityModel.fromJson(activityJson))
          .toList();
      return myactivitylist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<AllActivityModel>> getAllActivity() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-open/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> ActivityJsonList = json.decode(response.body);
      final List<AllActivityModel> myactivitylist = ActivityJsonList
          .map((activityJson) => AllActivityModel.fromJson(activityJson))
          .toList();
      return myactivitylist;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<AllActivityModel>> getHomePageActivity() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-hot/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> ActivityJsonList = json.decode(response.body);
      final List<AllActivityModel> myactivitylist = ActivityJsonList
          .map((activityJson) => AllActivityModel.fromJson(activityJson))
          .toList();
      return myactivitylist;
    } else {
      throw ServerFailure();
    }
  }
}