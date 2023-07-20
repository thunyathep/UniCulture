import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/homepage/data/model/reward_model.dart';

@immutable
abstract class HomepageState extends Equatable{
  late List<RewardModel> listReward = [];

  @override
  List<Object?> get prop => [listReward];
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