import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/dashboard/data/data_sources/remote/dashboard_remote.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';
import 'package:unihr/feature/dashboard/domain/repositories/dashboard_repositor.dart';



class DashBoardRepositoryImpl implements DashBoardRepositories{
  final Dashboard_remote dashboard_remote;

  DashBoardRepositoryImpl(this.dashboard_remote);

  @override
  Future<Either<Failures,List<DashboardModel>>> getDashBoard() async {
    try{
      final dashboard = await dashboard_remote.getDashboard();
      return Right(dashboard);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failures, void>> answerQuestionThreeSixty(
  //     List<AnswerQuestionToJson> answerList,
  //     )async{
  //   try{
  //     final data = await threeSixty_remote.AnswerQuestionThreeSixty(
  //         answerList
  //     );
  //     return Right(data);
  //   } on SeverException {
  //     return left(ServerFailure());
  //   }
  // }
}