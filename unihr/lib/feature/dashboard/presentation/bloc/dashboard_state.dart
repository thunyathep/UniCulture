import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';


@immutable
abstract class DashBoardState extends Equatable {
  late List<DashboardModel> listDashboard = [];

  @override
  List<Object?> get props => [listDashboard];
}

class InitialDashboard extends DashBoardState {
  @override
  List<Object?> get props => [];
}

class DashboardLoadingState extends DashBoardState {
  @override
  List<Object?> get props => [];
}

class DashboardLoadedState extends DashBoardState {
  DashboardLoadedState(List<DashboardModel> list) {
    super.listDashboard = list;
  }

  @override
  List<Object?> get props => [listDashboard];
}

class DashboardError extends DashBoardState {
  final String error;

  DashboardError(this.error);

  @override
  List<Object?> get props => [];
}

class SendingDashboardState extends DashBoardState{
  @override
  List<Object?> get props => [];
}

class SendedDashboardState extends DashBoardState{
  @override
  List<Object?> get props => [];
}
class ErrorDashboard extends DashBoardState{
  final String error;

  ErrorDashboard(this.error);
  @override
  List<Object?> get props => [];
}