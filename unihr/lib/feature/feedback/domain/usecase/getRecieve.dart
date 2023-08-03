import 'package:dartz/dartz.dart';
import 'package:unihr/feature/feedback/domain/entity/feedback_entity.dart';
import 'package:unihr/feature/feedback/domain/repository/feedback_repositories.dart';

import '../../../../core/error/failure.dart';

class GetRecieveFeedback {
  final FeedBackRepositories feedBackRepositories;

  GetRecieveFeedback(this.feedBackRepositories);

  Future<Either<Failures, List<FeedbackEntity>>> execute() async =>
      await feedBackRepositories.getRecieveFeedback();
}