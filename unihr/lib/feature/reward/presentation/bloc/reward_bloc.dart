import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/reward/data/datasource/remote/myreward_remote.dart';
import 'package:unihr/feature/reward/data/model/myreward_model.dart';
import 'package:unihr/feature/reward/data/model/redeem_reward_model.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_event.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_state.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState>{
  List<MyRewardModel> listreward = [];
  List<RedeemRewardModel> listredeem = [];
  MyReward_remoteImpl myReward_remoteImpl = MyReward_remoteImpl(http.Client());

  RewardBloc() : super(InitialReward()){

    on<GetMyReward>((event, emit) async {
      emit(MyRewardLoadingState());
      try{
        final List<MyRewardModel> listReward = await myReward_remoteImpl.getMyReward();
        final List<MyRewardModel> listreward = listReward;
        emit(MyRewardLoadedState(listreward));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(MyRewardError(e.toString()));
      }
    });

    on<GetRedeemReward>((event, emit) async {
      emit(RedeemRewardLoadingState());
      try{
        final List<RedeemRewardModel> listRedeem =
        await myReward_remoteImpl.getRedeemReward();
        final List<RedeemRewardModel> listredeem = listRedeem;
        emit(RedeemRewardLoadedState(listredeem));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(RedeemRewardError(e.toString()));
      }
    });
  }
}