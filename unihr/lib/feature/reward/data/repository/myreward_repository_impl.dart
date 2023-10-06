import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/reward/data/datasource/remote/myreward_remote.dart';

import '../../domain/repository/myreward_repository.dart';
import '../model/myreward_model.dart';
import '../model/redeem_reward_model.dart';

class MyRewardRepositoryImpl implements MyRewardRepository{
  final MyReward_remote myReward_remote;

  MyRewardRepositoryImpl(this.myReward_remote);

  @override
  Future<Either<Failures,List<MyRewardModel>>> getMyReward() async {
    try{
      final reward = await myReward_remote.getMyReward();
      return Right(reward);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures,List<RedeemRewardModel>>> getRedeemReward() async {
    try{
      final redeemreward = await myReward_remote.getRedeemReward();
      return Right(redeemreward);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures,List<RedeemRewardModel>>> getRedeemRewardHomePage() async {
    try{
      final redeemreward = await myReward_remote.getRedeemRewardHomePage();
      return Right(redeemreward);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}