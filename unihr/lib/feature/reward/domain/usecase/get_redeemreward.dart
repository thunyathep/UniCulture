import 'package:dartz/dartz.dart';
import 'package:unihr/feature/reward/domain/entity/redeem_reward_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/myreward_repository.dart';


class GetRedeemReward{
  final MyRewardRepository myRewardRepository;

  GetRedeemReward(this.myRewardRepository);

  Future<Either<Failures, List<RedeemRewardEntity>>> execute() async =>
      await myRewardRepository.getRedeemReward();
}