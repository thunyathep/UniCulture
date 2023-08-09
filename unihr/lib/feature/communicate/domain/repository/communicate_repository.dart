import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/communicate/domain/entity/communicate_entity.dart';

abstract class CommunicateRepository{
  Future<Either<Failures, List<CommunicateEntity>>> getCommunicate();
}