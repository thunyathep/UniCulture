

import 'package:equatable/equatable.dart';

abstract class FeedbackEvent extends Equatable{
  const FeedbackEvent();
}

class GetRecieveFeedback extends FeedbackEvent{
  @override
  List<Object> get props => [];
}

class GetSendedFeedback extends FeedbackEvent{
  @override
  List<Object> get props => [];
}