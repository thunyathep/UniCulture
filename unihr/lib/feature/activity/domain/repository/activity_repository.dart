import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';


abstract class ActivityRepository{
  Future<Either<Failures, List<MyActivityModel>>> getMyActivity();
}