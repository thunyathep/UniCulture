import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/myactivity_model.dart';

@immutable
abstract class ActivityState extends Equatable{
  late List<MyActivityModel> listactivity = [];
}

class InitialActivity extends ActivityState{
  @override
  List<Object?> get props => [];
}

class MyActivityLoadingState extends ActivityState {
  @override
  List<Object?> get props => [];
}

class MyActivityLoadedState extends ActivityState{
  MyActivityLoadedState(List<MyActivityModel> list){
    super.listactivity = list;
  }
  @override
  List<Object?> get props => [listactivity];
}

class MyACtivityError extends ActivityState{
  final String error;

  MyACtivityError(this.error);
  @override
  List<Object?> get props => [];
}