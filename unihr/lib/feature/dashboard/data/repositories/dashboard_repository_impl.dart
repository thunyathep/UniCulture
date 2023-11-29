import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/dashboard/data/data_sources/remote/dashboard_remote.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';
import 'package:unihr/feature/dashboard/domain/repositories/dashboard_repositor.dart';
import 'package:unihr/feature/dashboard/domain/use_cases/getDashboardFilter.dart';

import '../../domain/entities/dashboard_entity.dart';



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

  @override
  Future<Either<Failures, void>> getDashboardFilter(
      int idMorale,
      List<SelectedFilterToJson> selectedFilter,
      )async{
    try{
      final data = await dashboard_remote.getDashboardFilter(
          idMorale,
          selectedFilter
      );
      return Right(data);
    } on SeverException {
      return left(ServerFailure());
    }
  }
}