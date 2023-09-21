import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/allactivity_model.dart';
import '../../data/model/myactivity_model.dart';

@immutable
abstract class ActivityState extends Equatable{
  late List<MyActivityModel> listactivity = [];
  late List<AllActivityModel> listallactivity = [];
  late List<AllActivityModel> listhomepageactivity = [];
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

class AllActivityLoadingState extends ActivityState {
  @override
  List<Object?> get props => [];
}

class AllActivityLoadedState extends ActivityState{
  AllActivityLoadedState(List<AllActivityModel> list){
    super.listallactivity = list;
  }
  @override
  List<Object?> get props => [listallactivity];
}

class AllACtivityError extends ActivityState{
  final String error;

  AllACtivityError(this.error);
  @override
  List<Object?> get props => [];
}

class HomePageActivityLoadingState extends ActivityState {
  @override
  List<Object?> get props => [];
}

class HomePageActivityLoadedState extends ActivityState{
  HomePageActivityLoadedState(List<AllActivityModel> list){
    super.listhomepageactivity = list;
  }
  @override
  List<Object?> get props => [listhomepageactivity];
}

class HomePageACtivityError extends ActivityState{
  final String error;

  HomePageACtivityError(this.error);
  @override
  List<Object?> get props => [];
}

class RegisteringActivity extends ActivityState{
  @override
  List<Object?> get props => [];
}

class RegisteredActivity extends ActivityState{
  @override
  List<Object?> get props => [];
}
class ErrorRegisterActivity extends ActivityState{
  final String error;

  ErrorRegisterActivity(this.error);
  @override
  List<Object?> get props => [];
}