import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/mission/data/model/mission_model.dart';


abstract class MissionRepository{
  Future<Either<Failures, List<MyMissionModel>>> getMyMission();
}