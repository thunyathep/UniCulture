import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/feature/heart/data/datasource/remote/heart_remote.dart';
import 'package:unihr/feature/heart/data/model/heart_model.dart';
import 'package:unihr/feature/heart/domain/repository/heart_repository.dart';
import '../../../../core/error/failure.dart';

class HeartRepositoryImpl implements HeartRepository{
  final Heart_remote heart_remote;

  HeartRepositoryImpl(this.heart_remote);

  @override
  Future<Either<Failures, List<HeartTransferModel>>> getHeartTransfer() async {
    try{
      final heartTransfer = await heart_remote.getHeartTransfer();
      return Right(heartTransfer);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, void>> sendHeartTransfer(
      int valueHeart,
      int idReceiver,
      int idSender,
      String detail,
      )async{
      try{
        final data = await heart_remote.sendHeart(
            valueHeart,
            idReceiver,
            idSender,
            detail
        );
        return Right(data);
      } on SeverException {
        return left(ServerFailure());
      }
  }
}