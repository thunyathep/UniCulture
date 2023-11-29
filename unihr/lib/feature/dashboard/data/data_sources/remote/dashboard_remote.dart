import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';

import '../../../../../core/storage/secure_storage.dart';
import '../../../domain/entities/dashboard_entity.dart';

abstract class Dashboard_remote{
  Future<List<DashboardModel>> getDashboard();
  Future<void> getDashboardFilter(
      int idMorale,
      List<SelectedFilterToJson> selectedFilter,
      );
}

class Dashboard_remoteImpl implements Dashboard_remote {
  final http.Client httpClient;

  Dashboard_remoteImpl(this.httpClient);

  @override
  Future<List<DashboardModel>> getDashboard() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/morale-kpi");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> dashboardJsonList = json.decode(response.body);
      final List<DashboardModel> dashboardList = dashboardJsonList
          .map((dashboardJson) => DashboardModel.fromJson(dashboardJson))
          .toList();
      return dashboardList;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> getDashboardFilter(
      int idMorale,
      List<SelectedFilterToJson> selectedFilter,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/morale-kpi");
    final response = await httpClient.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-access-token': '${await LoginStorage.readToken()}',
      },
      body: jsonEncode({
        "idMorale" : idMorale,
        "selectedFilter" : selectedFilter,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 201) {
      log("Success");
    } else {
      log("UnSuccess");
      throw ServerFailure();
    }
  }

}