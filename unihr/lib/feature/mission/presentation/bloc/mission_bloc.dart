import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/mission/data/datasource/remote/mission_remote.dart';
import 'package:unihr/feature/mission/presentation/bloc/mission_event.dart';

import '../../data/model/mission_model.dart';
import 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState>{
  List<MyMissionModel> listmymission = [];

  Mission_remoteImpl mission_remoteImpl = Mission_remoteImpl(http.Client());

  MissionBloc() : super(InitialMission()){
    on<GetMyMission>((event, emit) async{
      emit(MyMissionLoadingState());
      try{
        final List<MyMissionModel> listmymission =
        await mission_remoteImpl.getMyMission();
        final List<MyMissionModel> listMyMission = listmymission;
        emit(MyMissionLoadedState(listMyMission));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyMissionError(e.toString()));
      }
    });
  }
}