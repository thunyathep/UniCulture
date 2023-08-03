import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/feedback/domain/entity/feedback_entity.dart';

abstract class FeedBackRepositories{
  Future<Either<Failures, List<FeedbackEntity>>> getRecieveFeedback();
  Future<Either<Failures, List<FeedbackEntity>>> getSendedFeedback();
}
