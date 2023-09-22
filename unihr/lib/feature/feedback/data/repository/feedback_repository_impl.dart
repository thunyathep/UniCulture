import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/feature/feedback/data/model/feedback_model.dart';
import 'package:unihr/feature/feedback/domain/entity/feedback_entity.dart';
import 'package:unihr/feature/feedback/domain/repository/feedback_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../datasource/remote/feedback_remote.dart';

class FeedBackRepositoryImpl implements FeedBackRepositories{
  final Feedback_remote feedback_remote;

  FeedBackRepositoryImpl(this.feedback_remote);

  @override
  Future<Either<Failures, List<FeedbackModel>>> getRecieveFeedback() async {
    try{
      final recieveFeedback = await feedback_remote.getRecieveFeedback();
      return Right(recieveFeedback);
    } on SeverException{
       return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, List<FeedbackModel>>> getSendedFeedback() async {
    try{
      final sendedFeedback = await feedback_remote.getSendedFeedback();
      return Right(sendedFeedback);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, void>> sendFeedback(
      String feedback,
      String feedbackType,
      int idReceiver,
      int idSender,
      )async{
    try{
      final data = await feedback_remote.sendFeedback(
        feedback,
        feedbackType,
        idReceiver,
        idSender,
      );
      return Right(data);
    } on SeverException {
      return left(ServerFailure());
    }
  }
}