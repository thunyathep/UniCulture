import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/mission_model.dart';

@immutable
abstract class MissionState extends Equatable{
  late List<MyMissionModel> listmission = [];
}

class InitialMission extends MissionState{
  @override
  List<Object?> get props => [];
}

class MyMissionLoadingState extends MissionState{
  @override
  List<Object?> get props => [];
}

class MyMissionLoadedState extends MissionState{
  MyMissionLoadedState(List<MyMissionModel> list){
    super.listmission = list;
  }
  @override
  List<Object?> get props => [listmission];
}

class MyMissionError extends MissionState{
  final String error;

  MyMissionError(this.error);
  @override
  List<Object?> get props => [];
}