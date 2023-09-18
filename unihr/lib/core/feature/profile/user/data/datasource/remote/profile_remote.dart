import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../../../../error/exception.dart';
import '../../../../../../storage/secure_storage.dart';
import '../../model/all_profile_user_model.dart';
import '../../model/profile_model.dart';

abstract class ProfileRemoteDataSource{
  Future<ProfileModel> getProfile();
  Future<List<AllProfileModel>> getAllProfile(String query);
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
  Future<List<AllProfileModel>> getAllProfile(String query) async{
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
      final List users = json.decode(response.body);
      final List<AllProfileModel> profileList =
      users.map((json) => AllProfileModel.fromJson(json)).where((user){
        final firstnameLower = user.firstName?.toLowerCase();
        final queryLower = query.toLowerCase();

        return firstnameLower?.contains(queryLower) ?? false;
      }).toList();
      return profileList;
    } else {
      throw SeverException();
    }
  }
}
