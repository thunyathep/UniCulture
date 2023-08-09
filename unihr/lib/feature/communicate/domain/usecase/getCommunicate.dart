import 'package:dartz/dartz.dart';
import 'package:unihr/feature/communicate/domain/entity/communicate_entity.dart';
import 'package:unihr/feature/communicate/domain/repository/communicate_repository.dart';
import '../../../../core/error/failure.dart';

class GetCommunicate {
  final CommunicateRepository communicateRepository;

  GetCommunicate(this.communicateRepository);

  Future<Either<Failures, List<CommunicateEntity>>> execute() async =>
      await communicateRepository.getCommunicate();
}