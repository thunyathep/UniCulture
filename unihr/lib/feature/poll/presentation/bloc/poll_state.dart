import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';




@immutable
abstract class PollState extends Equatable{
  late List<Poll_Model> listpoll = [];
}

class InitialPoll extends PollState{
  @override
  List<Object?> get props => [];
}

class PollLoadingState extends PollState {
  @override
  List<Object?> get props => [];
}

class PollLoadedState extends PollState{
  PollLoadedState(List<Poll_Model> list){
    super.listpoll = list;
  }
  @override
  List<Object?> get props => [listpoll];
}

class SendingPollState extends PollState{
  @override
  List<Object?> get props => [];
}

class SendedPollState extends PollState{
  @override
  List<Object?> get props => [];
}

class PollError extends PollState{
  final String error;

  PollError(this.error);
  @override
  List<Object?> get props => [];
}
