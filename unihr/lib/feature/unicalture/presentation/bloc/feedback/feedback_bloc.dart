import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/unicalture/data/datasource/remote/feedback_remote.dart';
import 'package:unihr/feature/unicalture/domain/repositories/feedback/feedback_repositories.dart';
import 'package:unihr/feature/unicalture/presentation/bloc/feedback/feedback_event.dart';
import 'package:unihr/feature/unicalture/presentation/bloc/feedback/feedback_state.dart';
import 'package:unihr/feature/unicalture/presentation/widgets/feedback/listFeedback.dart';
import 'package:http/http.dart' as http;

import '../../../data/model/feedback/feedback_model.dart';


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

