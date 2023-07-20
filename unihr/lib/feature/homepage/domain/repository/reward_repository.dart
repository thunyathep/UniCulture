import 'package:dartz/dartz.dart';
import 'package:unihr/feature/homepage/domain/entity/reward_entity.dart';
import '../../../../core/error/failure.dart';

abstract class RewardRepository {
  Future<Either<Failures, List<RewardEntity>>> getReward();
}