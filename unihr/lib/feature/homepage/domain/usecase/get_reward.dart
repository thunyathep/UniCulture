import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';
import 'package:unihr/feature/homepage/domain/entity/reward_entity.dart';

import '../../../../core/error/failure.dart';
import '../repository/homepage_repository.dart';


class GetReward{
  final HomepageRepository homepageRepository;

  GetReward(this.homepageRepository);

  Future<Either<Failures, List<RewardEntity>>> execute() async =>
      await homepageRepository.getReward();
}