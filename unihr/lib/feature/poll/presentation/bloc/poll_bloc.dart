import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/poll/data/data_sources/remote/poll_remote.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_event.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_state.dart';

class PollBloc extends Bloc<PollEvent, PollState>{
  List<Poll_Model> listpoll = [];
  Poll_remoteImpl poll_remoteImpl = Poll_remoteImpl(http.Client());

  PollBloc() : super(InitialPoll()) {
    on<GetPoll>((event, emit) async {
      emit(PollLoadingState());
      try {
        final List<Poll_Model> listpoll =
        await poll_remoteImpl.getPoll();
        final List<Poll_Model> listPoll = listpoll;
        emit(PollLoadedState(listPoll));
      } catch (e, stracktrace) {
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(PollError(e.toString()));
      }
    });
  }
}