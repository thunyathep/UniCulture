import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';

import '../../data/model/heart_receive_year_model.dart';



abstract class HeartReceiveYearRepository{
  Future<Either<Failures, List<HeartYearModel>>> getHeartYear();
}