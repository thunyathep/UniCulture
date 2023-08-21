import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';
import 'package:unihr/feature/pocket/domain/repository/heart_recieve_year_repository.dart';

import '../datasource/remote/heart_year_remote.dart';


class HeartYearRepositoryImpl implements HeartReceiveYearRepository{
  final HeartYear_Remote heartYear_remote;

  HeartYearRepositoryImpl(this.heartYear_remote);

  @override
  Future<Either<Failures, List<HeartYearModel>>> getHeartYear() async{
    try{
      final heart = await heartYear_remote.getHeartYear();
      return Right(heart);
    }on SeverException{
      return Left(ServerFailure());
    }
  }
}