import 'package:dartz/dartz.dart';
import 'package:unihr/feature/dashboard/domain/entities/dashboard_entity.dart';
import 'package:unihr/feature/dashboard/domain/repositories/dashboard_repositor.dart';
import '../../../../core/error/failure.dart';

class GetDashboardFilterUsecase {
  final DashBoardRepositories dashBoardRepositories;

  GetDashboardFilterUsecase(this.dashBoardRepositories);

  Future<Either<Failures, void>> call(
      int idMorale,
      List<SelectedFilterToJson> selectedFilter
      )async{
    return await dashBoardRepositories.getDashboardFilter(
      idMorale,
      selectedFilter,
    );
  }
}