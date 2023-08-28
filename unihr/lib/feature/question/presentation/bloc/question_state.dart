import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/question/data/model/question_model.dart';



@immutable
abstract class QuestionState extends Equatable{
  late List<QuestionModel> listquestion = [];

}

class InitialQuestion extends QuestionState{
  @override
  List<Object?> get props => [];
}

class MyQuestionLoadingState extends QuestionState {
  @override
  List<Object?> get props => [];
}

class MyQuestionLoadedState extends QuestionState{
  MyQuestionLoadedState(List<QuestionModel> list){
    super.listquestion = list;
  }
  @override
  List<Object?> get props => [listquestion];
}

class MyQuestionError extends QuestionState{
  final String error;

  MyQuestionError(this.error);
  @override
  List<Object?> get props => [];
}