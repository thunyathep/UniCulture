import 'package:dartz/dartz.dart';
import 'package:unihr/feature/score/domain/entity/score_entity.dart';
import '../../../../core/error/failure.dart';

abstract class ScoreRepository {
  Future<Either<Failures, List<ScoreEntity>>> getHeartleaderboard();
  Future<Either<Failures, List<ScoreEntity>>> getCoinleaderboard();
}