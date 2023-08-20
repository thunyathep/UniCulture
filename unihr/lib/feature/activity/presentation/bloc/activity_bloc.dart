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

    on<GetCardActivityHomePage>((event, emit) async {
      emit(HomePageActivityLoadingState());
      try{
        final List<AllActivityModel> listActivity = await activity_remoteImpl.getHomePageActivity();
        final List<AllActivityModel> listactivity = listActivity;
        emit(HomePageActivityLoadedState(listactivity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(HomePageACtivityError(e.toString()));
      }
    });

    on<GetMyActivityStatus>((event, emit) async{
      emit(MyActivityLoadingState());
      try{
        List<MyActivityModel> activitystatus = [];
        if(event.status == 0 ){
          activitystatus = await activity_remoteImpl.getMyActivity();
        }else if (event.status == 1 ){
          activitystatus = activitystatus
              .where((element) => element.idActivityStatus == 1).toList();
        }
        else if (event.status == 2 ){
          activitystatus = activitystatus
              .where((element) => element.idActivityStatus == 2).toList();
        }
        else if (event.status == 4 ){
          activitystatus = activitystatus
              .where((element) => element.idActivityStatus == 4).toList();
        }
        else if (event.status == 5){
          activitystatus = activitystatus
              .where((element) => element.idActivityStatus == 5).toList();
        }
        emit(MyActivityLoadedState(activitystatus));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyACtivityError(e.toString()));
      }
    });
  }
}