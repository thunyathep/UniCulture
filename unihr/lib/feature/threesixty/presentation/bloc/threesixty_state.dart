import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/threesixty/data/models/threesixty_model.dart';


@immutable
abstract class ThreeSixtyState extends Equatable{
  late List<ThreeSixtyModel> listQuestion = [];
}

class InitialThreeSixty extends ThreeSixtyState {
  @override
  List<Object?> get props => [];
}

class ThreeSixtyLoadingState extends ThreeSixtyState{

  @override
  List<Object?>get props => [];
}

class ThreeSixtyLoadedState extends ThreeSixtyState {
  ThreeSixtyLoadedState(List<ThreeSixtyModel> list){
    super.listQuestion = list;
  }

  @override
  List<Object?> get props => [listQuestion];
}

class ThreeSixtyError extends ThreeSixtyState {
  final String error;

  ThreeSixtyError(this.error);
  @override
  List<Object?> get props => [];
}