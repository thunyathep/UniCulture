import 'package:dartz/dartz.dart';
import 'package:unihr/feature/mission/data/model/mission_model.dart';
import 'package:unihr/feature/mission/domain/repository/mission_repository.dart';

import '../../../../../core/error/failure.dart';

class GetMyMission {
  final MissionRepository missionRepository;

  GetMyMission(this.missionRepository);

  Future<Either<Failures, List<MyMissionModel>>> execute() async =>
      await missionRepository.getMyMission();
}