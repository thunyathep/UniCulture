import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';

import '../../data/model/pocket_model.dart';


abstract class PocketRepository{
  Future<Either<Failures, List<PocketModel>>> getPocket();
}