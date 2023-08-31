import 'package:equatable/equatable.dart';

abstract class QuestionEvent extends Equatable{
  const QuestionEvent();
}

class GetQuestion extends QuestionEvent{
  @override
  List<Object?> get props => [];
}

class GetMoraleDiary extends QuestionEvent{
  @override
  List<Object?> get props => [];
}