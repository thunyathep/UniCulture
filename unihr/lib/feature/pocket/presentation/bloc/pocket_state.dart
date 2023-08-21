import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';

import '../../data/model/pocket_model.dart';

@immutable
abstract class PocketState extends Equatable{
  late List<PocketModel> listcoin = [];
  late List<HeartYearModel> listheartyear = [];
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

class LoadedPocketState extends PocketState{
  @override
  List<Object?> get props => [listcoin];
}

class PocketError extends PocketState{
  final String error;

  PocketError(this.error);
  @override
  List<Object?> get props => [];
}
