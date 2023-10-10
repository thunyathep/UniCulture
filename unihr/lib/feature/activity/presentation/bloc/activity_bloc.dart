import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/activity/data/datasource/remote/activity_remote.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';
import 'package:unihr/feature/activity/domain/usecase/unregis_activity.dart';

import '../../data/model/myactivity_model.dart';
import '../../domain/usecase/register_activitiy.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState>{
  List<MyActivityModel> listmyactivity = [];
  List<AllActivityModel> listallactivity = [];
  List<MyActivityModel> activitystatus = [];
  RegisterActivityUsecase registerActivityUsecase;
  UnRegisterActivityUsecase unRegisterActivityUsecase;

  Activity_remoteImpl activity_remoteImpl = Activity_remoteImpl(http.Client());

  ActivityBloc({required this.registerActivityUsecase,
    required this.unRegisterActivityUsecase}) : super(InitialActivity()){
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
        List<MyActivityModel> activity = [];
        if(event.status == 0 ){
          activitystatus = await activity_remoteImpl.getMyActivity();
          activity = activitystatus;
        }else if (event.status == 1 ){
          activity = activitystatus
              .where((element) => element.idActivityStatus == 1).toList();
        }
        else if (event.status == 2 ){
          activity = activitystatus
              .where((element) => element.idActivityStatus == 2).toList();
        }
        else if (event.status == 4 ){
          activity = activitystatus
              .where((element) => element.idActivityStatus == 4).toList();
        }
        else if (event.status == 5){
          activity = activitystatus
              .where((element) => element.idActivityStatus == 5).toList();
        }
        emit(MyActivityLoadedState(activity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyACtivityError(e.toString()));
      }
    });

    on<RegisterActivity>((event, emit) async {
      emit(RegisteringActivity());
      var response = await registerActivityUsecase(
        event.idActivity,
        event.idEmployee,
      );
      response.fold(
              (l) => emit(ErrorRegisterActivity("Something wrong")),
              (r) => emit(RegisteredActivity()));
    });

    on<UnRegisterActivity>((event, emit) async {
      emit(UnRegisteringActivity());
      var response = await unRegisterActivityUsecase(
        event.idActivity,
        event.idEmployee,
      );
      response.fold(
              (l) => emit(ErrorRegisterActivity("Something wrong")),
              (r) => emit(UnRegisteredActivity()));
    });
  }
}