import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/feature/poll/data/data_sources/remote/poll_remote.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';
import 'package:unihr/feature/poll/domain/repositories/poll_repository.dart';
import '../../../../core/error/failure.dart';

class PollRepositoryImpl implements PollRepository{
  final Poll_remote poll_remote;
  PollRepositoryImpl(this.poll_remote);

  @override
  Future<Either<Failures, List<Poll_Model>>> getPoll() async {
    try{
      final poll = await poll_remote.getPoll();
      return Right(poll);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}