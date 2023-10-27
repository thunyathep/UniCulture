import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:unihr/feature/score/data/model/score_model.dart';
import 'package:unihr/feature/score/domain/repository/score_repository.dart';
import '../../../../core/error/failure.dart';
import '../datasource/remote/score_remote.dart';

class ScoreRepositoryImpl implements ScoreRepository{
  final Score_remote score_remote;

  ScoreRepositoryImpl(this.score_remote);

  @override
  Future<Either<Failures, List<ScoreModel>>> getHeartleaderboard() async {
    try{
      final heartleader = await score_remote.getHeartleaderboard();
      return Right(heartleader);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, List<ScoreModel>>> getCoinleaderboard() async {
    try{
      final coinleader = await score_remote.getCoinleaderboard();
      return Right(coinleader);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}