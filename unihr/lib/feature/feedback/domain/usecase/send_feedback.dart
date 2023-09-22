import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/feedback_repositories.dart';

class SendFeedbackUsecase {
  final FeedBackRepositories feedBackRepositories;

  SendFeedbackUsecase(this.feedBackRepositories);

  Future<Either<Failures, void>> call(
      String feedback,
      String feedbackType,
      int idReceiver,
      int idSender,
      )async{
    return await feedBackRepositories.sendFeedback(
      feedback,
      feedbackType,
      idReceiver,
      idSender,
    );
  }
}