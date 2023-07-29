import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/activity/data/datasource/remote/activity_remote.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';

import '../../data/model/myactivity_model.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState>{
  List<MyActivityModel> listmyactivity = [];
  List<AllActivityModel> listallactivity = [];

  Activity_remoteImpl activity_remoteImpl = Activity_remoteImpl(http.Client());

  ActivityBloc() : super(InitialActivity()){
    on<GetMyActivity>((event, emit) async{
      emit(MyActivityLoadingState());
      try{
        final List<MyActivityModel> listmyactivity =
        await activity_remoteImpl.getMyActivity();
        final List<MyActivityModel> listMyActivity = listmyactivity;
        emit(MyActivityLoadedState(listMyActivity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyACtivityError(e.toString()));
      }
    });

    on<GetAllActivity>((event, emit) async{
      emit(AllActivityLoadingState());
      try{
        final List<AllActivityModel> listallactivity =
        await activity_remoteImpl.getAllActivity();
        final List<AllActivityModel> listAllActivity = listallactivity;
        emit(AllActivityLoadedState(listAllActivity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(AllACtivityError(e.toString()));
      }
    });
  }
}