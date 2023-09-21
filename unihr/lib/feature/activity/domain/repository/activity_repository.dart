import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';


abstract class ActivityRepository{
  Future<Either<Failures, List<MyActivityModel>>> getMyActivity();
  Future<Either<Failures, List<AllActivityModel>>> getAllActivity();
  Future<Either<Failures, List<AllActivityModel>>> getHomePageActivity();
  Future<Either<Failures, void>> registerActivity(
      int idActivity,
      int idEmployee,
      );
}