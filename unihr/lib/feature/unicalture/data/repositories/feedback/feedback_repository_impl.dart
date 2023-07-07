import 'package:dartz/dartz.dart';
import 'package:unihr/feature/unicalture/domain/entities/Feedback_entity.dart';
import 'package:unihr/feature/unicalture/domain/repositories/feedback/Feedback_repositories.dart';

import '../../../../../core/error/failure.dart';
import '../../datasource/remote/Feedback_remote.dart';

class FeedBackRepositoryImpl implements FeedBackRepositories{
  final Feedback_remote feedback_remote;

  FeedBackRepositoryImpl(this.feedback_remote);

  @override
  Future<Either<Failures, FeedbackEntity>> getRecieveFeedback() async {
    try{
      final recieveFeedback = await feedback_remote.getReceiveFeedback();
      return Right(recieveFeedback);
    } on Exception{
       return left(ServerFailure());
    }
  }
}