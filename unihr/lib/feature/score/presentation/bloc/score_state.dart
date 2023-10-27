import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/score/data/model/score_model.dart';


@immutable
abstract class ScoreState extends Equatable {
  late List<ScoreModel> listscore = [];

  @override
  List<Object?> get props => [listscore];
}

class InitialScore extends ScoreState {
  @override
  List<Object?> get props => [];
}

class ScoreLoadingState extends ScoreState {
  @override
  List<Object?> get props => [];
}

class ScoreLoadedState extends ScoreState {
  ScoreLoadedState(List<ScoreModel> list) {
    super.listscore = list;
  }

  @override
  List<Object?> get props => [listscore];
}

class ScoreError extends ScoreState {
  final String error;

  ScoreError(this.error);

  @override
  List<Object?> get props => [];
}

// class SendingFeedBackState extends FeedbackState{
//   @override
//   List<Object?> get props => [];
// }
//
// class SendedFeedBackState extends FeedbackState{
//   @override
//   List<Object?> get props => [];
// }
// class ErrorFeedback extends FeedbackState{
//   final String error;
//
//   ErrorFeedback(this.error);
//   @override
//   List<Object?> get props => [];
// }