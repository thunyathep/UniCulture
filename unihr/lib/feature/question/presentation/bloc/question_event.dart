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

class SendAnswerDiary extends QuestionEvent{
  final int idEmployee;
  final int idMoraledaily;
  final String answer;
  final DateTime answerDate;
  final String firstName;
  final String lastName;

  const SendAnswerDiary({
    required this.idEmployee,
    required this.idMoraledaily,
    required this.answer,
    required this.answerDate,
    required this.firstName,
    required this.lastName,
});


  @override
  List<Object?> get props => [
  idEmployee,
  idMoraledaily,
  answer,
  answerDate,
  firstName,
  lastName,
  ];
}