import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
}

class GetDashBoard extends DashboardEvent{
  int status;
  GetDashBoard(this.status);
  @override
  List<Object> get props => [];
}

// class SendingFeedBackEvent extends FeedbackEvent{
//   String feedback;
//   String feedbackType;
//   int idReceiver;
//   int idSender;
//
//   SendingFeedBackEvent({
//     required this.feedback,
//     required this.feedbackType,
//     required this.idReceiver,
//     required this.idSender,
//   });
//
//   @override
//   List<Object?> get props => [
//     feedback,
//     feedbackType,
//     idReceiver,
//     idSender,
//   ];
// }