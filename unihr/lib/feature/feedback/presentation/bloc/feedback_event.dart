import 'package:equatable/equatable.dart';

abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();
}

class GetFeedback extends FeedbackEvent{
  int status;
  GetFeedback(this.status);
  @override
  List<Object> get props => [];
}

class GetSendedFeedback extends FeedbackEvent{
  @override
  List<Object> get props => [];
}

class SendingFeedBackEvent extends FeedbackEvent{
  String feedback;
  String feedbackType;
  int idReceiver;
  int idSender;

  SendingFeedBackEvent({
    required this.feedback,
    required this.feedbackType,
    required this.idReceiver,
    required this.idSender,
  });

  @override
  List<Object?> get props => [
    feedback,
    feedbackType,
    idReceiver,
    idSender,
  ];
}