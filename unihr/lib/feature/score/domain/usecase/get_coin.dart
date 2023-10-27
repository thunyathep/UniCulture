import 'package:dartz/dartz.dart';
import 'package:unihr/feature/score/domain/entity/score_entity.dart';
import 'package:unihr/feature/score/domain/repository/score_repository.dart';
import '../../../../core/error/failure.dart';

class GetHeartLearderUsecase {
  final ScoreRepository scoreRepository;

  GetHeartLearderUsecase(this.scoreRepository);

  Future<Either<Failures, List<ScoreEntity>>> execute() async =>
      await scoreRepository.getCoinleaderboard();
}