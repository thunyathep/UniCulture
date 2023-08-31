import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';

import '../entity/moralediary_entity.dart';


abstract class MoraleRepository{
  Future<Either<Failures, List<MoraleDiaryEntity>>> getMoraleDiary();
}