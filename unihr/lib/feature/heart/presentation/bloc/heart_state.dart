import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/heart_model.dart';

@immutable
abstract class HeartState extends Equatable{
  late List<HeartTransferModel> listheart = [];

  @override
  List<Object?> get props => [listheart];
}

class InitialHeart extends HeartState {
  @override
  List<Object?> get props => [];
}

class HeartLoadingState extends HeartState {
  @override
  List<Object?> get props => [];
}

class HeartLoadedState extends HeartState {
  HeartLoadedState(List<HeartTransferModel> list) {
    super.listheart = list;
  }

  @override
  List<Object?> get props => [listheart];
}

class HeartError extends HeartState {
  final String error;

  HeartError(this.error);

  @override
  List<Object?> get props => [];
}

class HeartSendingState extends HeartState {
  @override
  List<Object?> get props => [];
}
class HeartSendingSuccessState extends HeartState {
  @override
  List<Object?> get props => [];
}