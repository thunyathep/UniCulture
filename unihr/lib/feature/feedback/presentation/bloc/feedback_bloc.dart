import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/feedback/data/datasource/remote/feedback_remote.dart';

import 'package:http/http.dart' as http;

import '../../data/model/feedback_model.dart';
import '../../domain/usecase/send_feedback.dart';
import 'feedback_event.dart';
import 'feedback_state.dart';


class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  List<FeedbackModel> listfeedback = [];
  Feedback_remoteImpl feedback_remoteImpl = Feedback_remoteImpl(http.Client());
  SendFeedbackUsecase sendFeedbackUsecase;


  FeedbackBloc({required this.sendFeedbackUsecase}) : super(InitialFeedback()) {
    on<GetFeedback>((event, emit) async {
      emit(FeedbackLoadingState());
      try {
        List<FeedbackModel> listFeedback = await feedback_remoteImpl.getRecieveFeedback();
        if(event.status == 0){
          listFeedback = listFeedback.where((element) =>
            element.idReceiver == 10068989).toList();
        }else if(event.status == 1){
          listFeedback = listFeedback.where((element) =>
            element.idSender == 10068989).toList();
        }
        emit(FeedbackLoadedState(listFeedback));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(FeedbackError(e.toString()));
      }
    });

    on<GetSendedFeedback>((event, emit) async {
      emit(FeedbackLoadingState());
      try {
        final List<FeedbackModel> listFeedback = await feedback_remoteImpl.getSendedFeedback();
        final List<FeedbackModel> listfeedback = listFeedback;
        emit(FeedbackLoadedState(listfeedback));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(FeedbackError(e.toString()));
      }
    });

    on<SendingFeedBackEvent>((event, emit) async {
      emit(SendingFeedBackState());
      var response = await sendFeedbackUsecase(
        event.feedback,
        event.feedbackType,
        event.idReceiver,
        event.idSender,
      );
      response.fold(
              (l) => emit(ErrorFeedback("Something wrong")),
              (r) => emit(SendedFeedBackState()));
    });
  }
}

