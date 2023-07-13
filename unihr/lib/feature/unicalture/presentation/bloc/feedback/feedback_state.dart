import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/unicalture/domain/entities/feedback_entity.dart';

import '../../../data/model/feedback/feedback_model.dart';

@immutable
abstract class FeedbackState extends Equatable {
  late List<FeedbackModel> listFeedback = [];

  @override
  List<Object?> get props => [listFeedback];
}

class InitialFeedback extends FeedbackState {
  @override
  List<Object?> get props => [];
}

class FeedbackLoadingState extends FeedbackState {
  @override
  List<Object?> get props => [];
}

class FeedbackLoadedState extends FeedbackState {
  FeedbackLoadedState(List<FeedbackModel> list) {
    super.listFeedback = list;
  }

  @override
  List<Object?> get props => [listFeedback];
}

class FeedbackError extends FeedbackState {
  final String error;

  FeedbackError(this.error);

  @override
  List<Object?> get props => [];
}