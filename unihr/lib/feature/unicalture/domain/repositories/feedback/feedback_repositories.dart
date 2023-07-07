import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/unicalture/domain/entities/feedback_entity.dart';

abstract class FeedBackRepositories{
  Future<Either<Failures, FeedbackEntity>> getRecieveFeedback();
}

