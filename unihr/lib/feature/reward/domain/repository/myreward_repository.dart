import 'package:dartz/dartz.dart';
import 'package:unihr/feature/reward/domain/entity/myreward_entity.dart';
import 'package:unihr/feature/reward/domain/entity/redeem_reward_entity.dart';
import '../../../../core/error/failure.dart';

abstract class MyRewardRepository {
  Future<Either<Failures, List<MyRewardEntity>>> getMyReward();
  Future<Either<Failures, List<RedeemRewardEntity>>> getRedeemReward();
}