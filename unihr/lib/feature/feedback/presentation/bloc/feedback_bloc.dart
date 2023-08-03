import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/feedback/data/datasource/remote/feedback_remote.dart';

import 'package:http/http.dart' as http;

import '../../data/model/feedback_model.dart';
import 'feedback_event.dart';
import 'feedback_state.dart';


class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  List<FeedbackModel> listfeedback = [];
  Feedback_remoteImpl feedback_remoteImpl = Feedback_remoteImpl(http.Client());


  FeedbackBloc() : super(InitialFeedback()) {
    on<GetRecieveFeedback>((event, emit) async {
      emit(FeedbackLoadingState());
      try {
        final List<FeedbackModel> listFeedback = await feedback_remoteImpl.getRecieveFeedback();
        final List<FeedbackModel> listfeedback = listFeedback;
        emit(FeedbackLoadedState(listfeedback));
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
  }
}

