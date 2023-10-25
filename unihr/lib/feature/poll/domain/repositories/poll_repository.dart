import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/poll/domain/entities/poll_entity.dart';

abstract class PollRepository{
  Future<Either<Failures, List<Poll_Entity>>> getPoll();
  Future<Either<Failures, void>> sendPoll(
      int idEmployee,
      int idPoll,
      int idPollQuestion,
      );
}