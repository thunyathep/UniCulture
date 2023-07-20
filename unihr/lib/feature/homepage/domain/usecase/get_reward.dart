import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';
import 'package:unihr/feature/homepage/domain/entity/reward_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/reward_repository.dart';


class GetReward{
  final RewardRepository rewardRepository;

  GetReward(this.rewardRepository);

  Future<Either<Failures, List<RewardEntity>>> execute() async =>
      await rewardRepository.getReward();
}