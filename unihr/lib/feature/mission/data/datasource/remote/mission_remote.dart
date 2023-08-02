import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/error/failure.dart';
import '../../model/mission_model.dart';


abstract class Mission_remote {
  Future<List<MyMissionModel>> getMyMission();
}

class Mission_remoteImpl {
  final http.Client httpClient;

  Mission_remoteImpl(this.httpClient);

  @override
  Future<List<MyMissionModel>> getMyMission() async{
    final url = Uri.parse(
      "https://uniculture-371814.as.r.appspot.com/api/mission-user/10068989"
    );
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> MissionJsonList = json.decode(response.body);
      final List<MyMissionModel> mymissionlist = MissionJsonList
          .map((missionJson) => MyMissionModel.fromJson(missionJson))
          .toList();
      return mymissionlist;
    } else {
      throw ServerFailure();
    }
  }
}