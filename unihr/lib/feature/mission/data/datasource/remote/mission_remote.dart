import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/error/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
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
      "https://uniculture-371814.as.r.appspot.com/api/mission-user/${await LoginStorage.readEmployeeId()}"
    );
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
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