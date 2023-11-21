import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/dashboard/domain/entities/dashboard_entity.dart';

abstract class DashBoardRepositories{
  Future<Either<Failures, List<DashboardFilterEntity>>> getDashBoard();
  // Future<Either<Failures, void>> getDashboardFilter(
  //     List<AnswerQuestionToJson> answerList,
  //     );
}
