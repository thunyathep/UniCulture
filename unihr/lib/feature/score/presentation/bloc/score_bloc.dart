import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/score/data/datasource/remote/score_remote.dart';
import 'package:unihr/feature/score/presentation/bloc/score_event.dart';
import 'package:unihr/feature/score/presentation/bloc/score_state.dart';

import '../../data/model/score_model.dart';


class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  List<ScoreModel> listscore = [];
  Score_remoteImpl score_remoteImpl = Score_remoteImpl(http.Client());


  ScoreBloc() : super(InitialScore()) {
    on<GetScoreHeart>((event, emit) async {
      emit(ScoreLoadingState());
      try {
        final List<ScoreModel> listscore =
        await score_remoteImpl.getHeartleaderboard();
        final List<ScoreModel> listScore = listscore;
        emit(ScoreLoadedState(listScore));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(ScoreError(e.toString()));
      }
    });

    on<GetScoreCoin>((event, emit) async {
      emit(ScoreLoadingState());
      try {
        final List<ScoreModel> listscore =
        await score_remoteImpl.getCoinleaderboard();
        final List<ScoreModel> listScore = listscore;
        emit(ScoreLoadedState(listScore));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(ScoreError(e.toString()));
      }
    });
  }
}

