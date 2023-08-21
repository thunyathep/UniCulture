import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';


@immutable
abstract class HeartYearState extends Equatable{
  late List<HeartYearModel> listheartyear = [];
}

class InitialHeartYear extends HeartYearState{
  @override
  List<Object?> get props => [];
}

class HeartYearLoadingState extends HeartYearState {
  @override
  List<Object?> get props => [];
}

class HeartYearLoadedState extends HeartYearState{
  HeartYearLoadedState(List<HeartYearModel> list){
    super.listheartyear = list;
  }
  @override
  List<Object?> get props => [listheartyear];
}

class HeartYearError extends HeartYearState{
  final String error;

  HeartYearError(this.error);
  @override
  List<Object?> get props => [];
}