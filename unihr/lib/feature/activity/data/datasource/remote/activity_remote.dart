import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';

abstract class Activity_remote{
  Future<List<MyActivityModel>> getMyActivity();
  Future<List<AllActivityModel>> getAllActivity();
  Future<List<AllActivityModel>> getHomePageActivity();
  Future<void> registerActivity(
      int idActivity,
      int idEmployee,
      );

  Future<void> unregisterActivity(
      int idActivity,
      int idEmployee,
      );
}

class Activity_remoteImpl implements Activity_remote{
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
          'x-access-token': '${await LoginStorage.readToken()}',
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

  @override
  Future<void> registerActivity(
      int idActivity,
      int idEmployee,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-register");
    final response = await httpClient.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        "idActivity" : idActivity,
        "idEmployee" : idEmployee,
      }
      ),
    );
    print(response.body);
    if (response.statusCode == 200) {
      log("Register Activity Success");
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> unregisterActivity(
      int idActivity,
      int idEmployee,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/activity-register");
    final response = await httpClient.delete(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        "idActivity" : idActivity,
        "idEmployee" : idEmployee,
      }
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      log("UnRegister Activity Success");
    } else {
      throw ServerFailure();
    }
  }
}