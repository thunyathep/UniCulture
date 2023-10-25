import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/poll/data/data_sources/remote/poll_remote.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_event.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_state.dart';

import '../../domain/use_cases/answer_poll.dart';

class PollBloc extends Bloc<PollEvent, PollState>{
  List<Poll_Model> listpoll = [];
  Poll_remoteImpl poll_remoteImpl = Poll_remoteImpl(http.Client());
  AnswerPollUsecase answerPollUsecase;

  PollBloc({required this.answerPollUsecase}) : super(InitialPoll()) {
    on<GetPoll>((event, emit) async {
      emit(PollLoadingState());
      try {
        final List<Poll_Model> listpoll =
        await poll_remoteImpl.getPoll();
        // final List<Poll_Model> listPoll = listpoll;
        emit(PollLoadedState(listpoll));
      } catch (e, stracktrace) {
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(PollError(e.toString()));
      }
    });

    on<AnswerPoll>((event, emit) async {
      emit(SendingPollState());
      var response = await answerPollUsecase(
        event.idEmployee,
        event.idPoll,
        event.idPollQuestion,
      );
      response.fold(
              (l) => emit(PollError("Something wrong")),
              (r) => emit(SendedPollState()));
    });
  }
}