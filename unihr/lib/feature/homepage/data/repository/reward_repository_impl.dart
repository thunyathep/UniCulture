import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/homepage/data/datasource/remote/reward_remote.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';
import 'package:unihr/feature/homepage/domain/repository/reward_repository.dart';

class RewardRepositoryImpl implements RewardRepository{
  final Reward_remote reward_remote;

  RewardRepositoryImpl(this.reward_remote);

  @override
  Future<Either<Failures,List<RewardModel>>> getReward() async {
    try{
      final reward = await reward_remote.getReward();
      return Right(reward);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}