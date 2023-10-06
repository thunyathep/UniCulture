import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/reward/data/model/myreward_model.dart';
import 'package:unihr/feature/reward/data/model/redeem_reward_model.dart';

@immutable
abstract class RewardState extends Equatable{
  late List<MyRewardModel> listReward = [];
  late List<RedeemRewardModel> listRedeem = [];
}

class InitialReward extends RewardState {
  @override
  List<Object?> get props => [];
}

class MyRewardLoadingState extends RewardState{

  @override
  List<Object?>get props => [];
}

class MyRewardLoadedState extends RewardState {
  MyRewardLoadedState(List<MyRewardModel> list){
    super.listReward = list;
  }

  @override
  List<Object?> get props => [listReward];
}

class MyRewardError extends RewardState {
  final String error;

  MyRewardError(this.error);
  @override
  List<Object?> get props => [];
}

class RedeemRewardLoadingState extends RewardState{
  @override
  List<Object?>get props => [];
}

class RedeemRewardLoadedState extends RewardState {
  RedeemRewardLoadedState(List<RedeemRewardModel> list){
    super.listRedeem = list;
  }

  @override
  List<Object?> get props => [listReward];
}

class RedeemRewardError extends RewardState {
  final String error;

  RedeemRewardError(this.error);
  @override
  List<Object?> get props => [];
}

class RedeemRewardHomePageLoadingState extends RewardState{
  @override
  List<Object?>get props => [];
}

class RedeemRewardHomePageLoadedState extends RewardState {
  RedeemRewardHomePageLoadedState(List<RedeemRewardModel> list){
    super.listRedeem = list;
  }

  @override
  List<Object?> get props => [listReward];
}