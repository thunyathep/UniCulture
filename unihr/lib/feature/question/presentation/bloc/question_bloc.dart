import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/question/data/datasource/remote/question_remote.dart';
import 'package:unihr/feature/question/data/model/moralediary_model.dart';
import 'package:unihr/feature/question/data/model/question_model.dart';
import 'package:unihr/feature/question/domain/repository/moralediary_repository.dart';
import 'package:unihr/feature/question/domain/usecase/send_answer_diary.dart';
import 'package:unihr/feature/question/presentation/bloc/question_event.dart';
import 'package:unihr/feature/question/presentation/bloc/question_state.dart';

import '../../data/datasource/remote/moralediary_remote.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState>{
  List<QuestionModel> listmyquestion = [];
  List<MoraleDiaryModel> listmoralediary = [];
  Question_remoteImpl question_remoteImpl = Question_remoteImpl(http.Client());
  MoraleDiary_remoteImpl moraleDiary_remoteImpl = MoraleDiary_remoteImpl(http.Client());

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
    on<GetMoraleDiary>((event, emit) async{
      emit(MoraleDiaryLoadingState());
      try{
        final List<MoraleDiaryModel> listmoralediary =
        await moraleDiary_remoteImpl.getMoraleDiary();
        final List<MoraleDiaryModel> listMoraleDiary = listmoralediary;
        emit(MoraleDiaryLoadedState(listMoraleDiary));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MoraleDiaryError(e.toString()));
      }
    });


    on<SendAnswerDiary>((event, emit) async{
      emit(SendAnswerLoadingState());
      SendAnswerDiaryUsecase sendAnswerDiaryUsecase = SendAnswerDiaryUsecase(MoraleRepository as MoraleRepository);
      var response = await sendAnswerDiaryUsecase(
          event.idEmployee,
          event.idMoraledaily,
          event.answer,
          event.answerDate,
          event.firstName,
          event.lastName,
      );
      response.fold(
              (l) => emit(SendAnswerFailuresState()),
              (r) => emit(SendAnswerSuccessState()));
    });
  }
}