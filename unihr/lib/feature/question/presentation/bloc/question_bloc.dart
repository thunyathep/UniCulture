import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/question/data/datasource/remote/question_remote.dart';
import 'package:unihr/feature/question/data/model/question_model.dart';
import 'package:unihr/feature/question/presentation/bloc/question_event.dart';
import 'package:unihr/feature/question/presentation/bloc/question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState>{
  List<QuestionModel> listmyquestion = [];

  Question_remoteImpl question_remoteImpl = Question_remoteImpl(http.Client());

  QuestionBloc() : super(InitialQuestion()){
    on<GetQuestion>((event, emit) async{
      emit(MyQuestionLoadingState());
      try{
        final List<QuestionModel> listmyquestion =
        await question_remoteImpl.getQuestion();
        final List<QuestionModel> listMyQuestion = listmyquestion;
        emit(MyQuestionLoadedState(listMyQuestion));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyQuestionError(e.toString()));
      }
    });
  }
}