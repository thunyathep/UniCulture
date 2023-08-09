import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/communicate/data/model/communicate_model.dart';

@immutable
abstract class CommunicateState extends Equatable{
  late List<CommunicateModel> listcommunicate = [];
}

class InitialCommunicate extends CommunicateState{
  @override
  List<Object?> get props => [];
}

class CommunicateLoadingState extends CommunicateState {
  @override
  List<Object?> get props => [];
}

class CommunicateLoadedState extends CommunicateState{
  CommunicateLoadedState(List<CommunicateModel> list){
    super.listcommunicate = list;
  }
  @override
  List<Object?> get props => [listcommunicate];
}

class CommunicateError extends CommunicateState{
  final String error;

  CommunicateError(this.error);
  @override
  List<Object?> get props => [];
}