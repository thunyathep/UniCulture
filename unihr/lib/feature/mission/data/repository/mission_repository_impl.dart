import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/mission/data/datasource/remote/mission_remote.dart';
import 'package:unihr/feature/mission/data/model/mission_model.dart';
import 'package:unihr/feature/mission/domain/repository/mission_repository.dart';

class MissionRepositoryImpl implements MissionRepository{
  final Mission_remote mission_remote;

  MissionRepositoryImpl(this.mission_remote);

  @override
  Future<Either<Failures, List<MyMissionModel>>> getMyMission()async{
    try{
      final mission = await mission_remote.getMyMission();
      return Right(mission);
    }on SeverException{
      return Left(ServerFailure());
    }
  }

}