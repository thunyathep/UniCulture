import 'package:dartz/dartz.dart';
import 'package:unihr/feature/threesixty/domain/entities/threesixty_entity.dart';
import '../../../../core/error/failure.dart';

abstract class ThreeSixtyRepository {
  Future<Either<Failures, List<ThreeSixtyEntity>>> getQuestionThreeSixty();
  Future<Either<Failures, void>> answerQuestionThreeSixty(
      List<AnswerQuestionToJson> answerList,
      );
}