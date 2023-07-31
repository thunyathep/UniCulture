import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/homepage/data/datasource/remote/hompage_remote.dart';
import 'package:unihr/feature/homepage/data/model/activity_model.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';
import 'package:unihr/feature/homepage/domain/repository/homepage_repository.dart';

class HomepageRepositoryImpl implements HomepageRepository{
  final Homepage_remote homepage_remote;

  HomepageRepositoryImpl(this.homepage_remote);

  @override
  Future<Either<Failures,List<RewardModel>>> getReward() async {
    try{
      final reward = await homepage_remote.getReward();
      return Right(reward);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures,List<ActivityModel>>> getActivity() async {
    try{
      final activity = await homepage_remote.getActivity();
      return Right(activity);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}