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
    on<GetScore>((event, emit) async {
      emit(ScoreLoadingState());
      try {
        List<ScoreModel> listScore = await score_remoteImpl.getHeartleaderboard();
        if(event.status == 0){
          listScore;
        }else if(event.status == 1){
          listScore = await score_remoteImpl.getCoinleaderboard();
        }
        emit(ScoreLoadedState(listScore));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(ScoreError(e.toString()));
      }
    });
  }
}

