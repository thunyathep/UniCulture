import 'package:equatable/equatable.dart';

abstract class PollEvent extends Equatable{
  const PollEvent();
}

class GetPoll extends PollEvent{
  @override
  List<Object?> get props => [];
}

class AnswerPoll extends PollEvent{
  int idEmployee;
  int idPoll;
  int idPollQuestion;

  AnswerPoll({
    required this.idEmployee,
    required this.idPoll,
    required this.idPollQuestion,
  });

  @override
  List<Object?> get props => [
    idEmployee,
    idPoll,
    idPollQuestion,
  ];
}