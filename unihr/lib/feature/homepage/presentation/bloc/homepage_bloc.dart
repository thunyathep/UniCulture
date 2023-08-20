import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/homepage/data/datasource/remote/hompage_remote.dart';
import 'package:unihr/feature/homepage/data/model/activity_model.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_event.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_state.dart';
import 'package:http/http.dart' as http;
import '../../data/model/reward_model.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState>{
  List<RewardModel> listreward = [];
  Homepage_remoteIpml homepage_remoteIpml = Homepage_remoteIpml(http.Client());

  HomepageBloc() : super(InitialReward()){
    on<GetReward>((event, emit) async {
      emit(RewardLoadingState());
      try{
        final List<RewardModel> listReward = await homepage_remoteIpml.getReward();
        final List<RewardModel> listreward = listReward;
        emit(RewardLoadedState(listreward));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(RewardError(e.toString()));
      }
    });


    on<GetActivity>((event, emit) async {
      emit(ActivityLoadingState());
      try{
        final List<ActivityModel> listActivity = await homepage_remoteIpml.getActivity();
        final List<ActivityModel> listactivity = listActivity;
        emit(ActivityLoadedState(listactivity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(RewardError(e.toString()));
      }
    });


    on<GetCard>((event, emit) async {
      emit(RewardLoadingState());
      try{
        final List<RewardModel> listReward = await homepage_remoteIpml.getReward();
        final List<RewardModel> listreward = listReward;
        final List<ActivityModel> listActivity = await homepage_remoteIpml.getActivity();
        final List<ActivityModel> listactivity = listActivity;
        emit(GetCardLoadedState(listreward, listactivity));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(RewardError(e.toString()));
      }
    });
  }
}