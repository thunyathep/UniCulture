import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/homepage/data/model/activity_model.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';

@immutable
abstract class HomepageState extends Equatable{
  late List<RewardModel> listReward = [];
  late List<ActivityModel> listactivity = [];

  @override
  List<Object?> get prop => [listReward,listactivity];

  // @override
  // List<Object?> get props => [listactivity];
}

class InitialReward extends HomepageState {
  @override
  List<Object?> get props => [];
}

class RewardLoadingState extends HomepageState{

  @override
  List<Object?>get props => [];
}

class RewardLoadedState extends HomepageState {
  RewardLoadedState(List<RewardModel> list){
    super.listReward = list;
  }

  @override
  List<Object?> get props => [listReward];
}

class RewardError extends HomepageState {
  final String error;

  RewardError(this.error);
  @override
  List<Object?> get props => [];
}

class ActivityLoadingState extends HomepageState{

  @override
  List<Object?>get props => [];
}

class ActivityLoadedState extends HomepageState {
  ActivityLoadedState(List<ActivityModel> list){
    super.listactivity = list;
  }

  @override
  List<Object?> get props => [listactivity];
}

class ActivityError extends HomepageState {
  final String error;

  ActivityError(this.error);
  @override
  List<Object?> get props => [];
}

class GetCardLoadedState extends HomepageState {
  GetCardLoadedState(List<RewardModel> list,List<ActivityModel> listactivity){
    super.listReward = list;
    super.listactivity = listactivity;
  }
  @override
  List<Object?> get props => [listReward, listactivity];
}