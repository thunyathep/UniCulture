import 'package:dartz/dartz.dart';
import 'package:unihr/feature/poll/domain/entities/poll_entity.dart';
import 'package:unihr/feature/poll/domain/repositories/poll_repository.dart';
import '../../../../core/error/failure.dart';

class GetPollUsecase {
  final PollRepository pollRepository;

  GetPollUsecase(this.pollRepository);

  Future<Either<Failures, List<Poll_Entity>>> execute() async =>
      await pollRepository.getPoll();
}