import 'package:dartz/dartz.dart';
import 'package:unihr/feature/homepage/domain/entity/reward_entity.dart';
import '../../../../core/error/failure.dart';
import '../entity/activity_entity.dart';

abstract class HomepageRepository {
  Future<Either<Failures, List<RewardEntity>>> getReward();
  Future<Either<Failures, List<ActivityEntity>>> getActivity();
}