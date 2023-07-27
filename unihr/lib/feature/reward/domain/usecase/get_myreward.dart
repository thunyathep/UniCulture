import 'package:dartz/dartz.dart';
import 'package:unihr/feature/reward/domain/entity/myreward_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/myreward_repository.dart';


class GetMyReward{
  final MyRewardRepository myRewardRepository;

  GetMyReward(this.myRewardRepository);

  Future<Either<Failures, List<MyRewardEntity>>> execute() async =>
      await myRewardRepository.getMyReward();
}