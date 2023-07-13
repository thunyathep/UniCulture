import 'package:dartz/dartz.dart';
import 'package:unihr/feature/unicalture/domain/entities/feedback_entity.dart';
import 'package:unihr/feature/unicalture/domain/repositories/feedback/feedback_repositories.dart';

import '../../../../../core/error/failure.dart';

class GetSendedFeedback {
  final FeedBackRepositories feedBackRepositories;

  GetSendedFeedback(this.feedBackRepositories);

  Future<Either<Failures, FeedbackEntity>> execute() async =>
      await feedBackRepositories.getSendedFeedback();
}