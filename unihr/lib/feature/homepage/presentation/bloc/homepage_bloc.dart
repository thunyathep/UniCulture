import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/homepage/data/datasource/remote/reward_remote.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_event.dart';
import 'package:unihr/feature/homepage/presentation/bloc/homepage_state.dart';
import 'package:http/http.dart' as http;
import '../../data/model/reward_model.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState>{
  List<RewardModel> listreward = [];
  Reward_remoteIpml reward_remoteIpml = Reward_remoteIpml(http.Client());

  HomepageBloc() : super(InitialReward()){
    on<GetReward>((event, emit) async {
      emit(RewardLoadingState());
      try{
        final List<RewardModel> listReward = await reward_remoteIpml.getReward();
        final List<RewardModel> listreward = listReward;
        emit(RewardLoadedState(listreward));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(RewardError(e.toString()));
      }
    });
  }
}