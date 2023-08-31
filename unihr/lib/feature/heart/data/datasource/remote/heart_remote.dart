import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz_streaming.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/heart/data/model/heart_model.dart';

import '../../../../../core/storage/secure_storage.dart';

abstract class Heart_remote{
  Future<List<HeartTransferModel>> getHeartTransfer();
  Future<void> sendHeart(
      String? reply,
      DateTime transferdat,
      int valueHeart,
      int idReceiver,
      int idSender,
      String detail,
      String senderFirstname,
      String senderLastname,
      String receiverFirstname,
      String receiverLastname,
      );
}

class Heart_remoteImpl implements Heart_remote {
  final http.Client httpClient;

  Heart_remoteImpl(this.httpClient);

  @override
  Future<List<HeartTransferModel>> getHeartTransfer() async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/heart-transfer/${await LoginStorage.readEmployeeId()}");
    final response = await httpClient.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> heartJsonList = json.decode(response.body);
      final List<HeartTransferModel> heartTransferList = heartJsonList
          .map((heartJson) => HeartTransferModel.fromJson(heartJson))
          .toList();
      return heartTransferList;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<void> sendHeart(
      String? reply,
      DateTime transferdat,
      int valueHeart,
      int idReceiver,
      int idSender,
      String detail,
      String senderFirstname,
      String senderLastname,
      String receiverFirstname,
      String receiverLastname,
      ) async {
    final url = Uri.parse(
        "https://uniculture-371814.as.r.appspot.com/api/heart-transfer");
    final response = await httpClient.post(url,
        // body: heartTransferModelToJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'x-access-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZEVtcGxveWVlIjoxMDA2ODk4OSwiaWF0IjoxNjg1Njk2MzU1LCJleHAiOjE3NDc5MDQzNTV9.DhEkFL75hsA3HrM339cn5Lf4QzHiZCuU_4RKJBlDbyg',
        }
    );
    if (response.statusCode == 200) {
      log("Sent Heart Success");
    } else {
      throw ServerFailure();
    }
  }
}