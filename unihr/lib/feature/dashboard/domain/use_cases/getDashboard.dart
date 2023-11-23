import 'package:dartz/dartz.dart';
import 'package:unihr/feature/dashboard/domain/entities/dashboard_entity.dart';
import 'package:unihr/feature/dashboard/domain/repositories/dashboard_repositor.dart';
import '../../../../core/error/failure.dart';

class GetDashboardUsecase {
  final DashBoardRepositories dashBoardRepositories;

  GetDashboardUsecase(this.dashBoardRepositories);

  Future<Either<Failures, List<DashboardEntity>>> execute() async =>
      await dashBoardRepositories.getDashBoard();
}