import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../../../../error/exception.dart';
import '../../../../../../storage/secure_storage.dart';
import '../../model/all_profile_user_model.dart';
import '../../model/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getProfile();
  Future<AllProfileModel> getAllProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final http.Client client;

  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<ProfileModel> getProfile() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/users/profile/${await LoginStorage.readEmployeeId()}");
    final response = await client.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      throw SeverException();
    }
  }


  @override
  Future<AllProfileModel> getAllProfile() async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/users");
    final response = await client.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': '${await LoginStorage.readToken()}',
        }
    );

    if (response.statusCode == 200) {
      return allprofileFromJson(response.body);
    } else {
      throw SeverException();
    }
  }
}
