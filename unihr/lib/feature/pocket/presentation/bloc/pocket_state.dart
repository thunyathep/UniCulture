import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/pocket_model.dart';

@immutable
abstract class PocketState extends Equatable{
  late List<PocketModel> listcoin = [];
}

class InitialPocket extends PocketState{
  @override
  List<Object?> get props => [];
}

class PocketLoadingState extends PocketState {
  @override
  List<Object?> get props => [];
}

class PocketLoadedState extends PocketState{
  PocketLoadedState(List<PocketModel> list){
    super.listcoin = list;
  }
  @override
  List<Object?> get props => [listcoin];
}

class PocketGetState extends PocketState{
  PocketGetState(List<PocketModel> list){
    super.listcoin = list;
  }
  @override
  List<Object?> get props => [listcoin];
}

class PocketError extends PocketState{
  final String error;

  PocketError(this.error);
  @override
  List<Object?> get props => [];
}