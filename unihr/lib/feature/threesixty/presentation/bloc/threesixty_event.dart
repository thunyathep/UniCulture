import 'package:equatable/equatable.dart';

import '../../domain/entities/threesixty_entity.dart';

abstract class ThreeSixtyEvent extends Equatable{
  const ThreeSixtyEvent();
}

class GetQuestionThreeSixtyEvent extends ThreeSixtyEvent{
  @override
  List<Object?> get props => [];
}

class AnswerThreeSixty extends ThreeSixtyEvent{
  List<AnswerQuestionToJson> answerList;

  AnswerThreeSixty({
    required this.answerList
  });

  @override
  List<Object?> get props => [
    answerList,
  ];
}