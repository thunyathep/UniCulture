import 'dart:convert';
import 'dart:developer';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../error/exception.dart';
import '../../../../../storage/secure_storage.dart';
import '../../../domain/entity/login_entity.dart';
import '../../model/login_model.dart';


abstract class LoginApi{
  Future<LoginEntity> login(String username,String password);
}

class LoginApiImpl implements LoginApi{
  final http.Client client;
  LoginApiImpl({required this.client});

  @override
  Future<LoginEntity> login(username,password) async{
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/auth/signin");
    Map tokenData;
    final res = await client.post(url,
        headers: {
          "Content-Type": "application/json;charset=UTF-8",
          },
        body: jsonEncode({
          "username":username,
          "password":password
        }));
    if(res.statusCode == 200){
      log(res.body);
      var data = loginFromJson(res.body);
      tokenData = JwtDecoder.decode(data.accessToken!);
      await LoginStorage.setMapData(
        tokenData['idRole'],
        tokenData['idEmployee'].toString(),
        tokenData['idCompany'],
        tokenData['iat'],
        tokenData['exp'],
      );
      await LoginStorage.setToken(data.accessToken!);
      return LoginEntity(
          roles: data.roles,
          accessToken: data.accessToken);
    }else{
      throw SeverException();
    }
  }
}
