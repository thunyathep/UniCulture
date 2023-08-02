import 'package:equatable/equatable.dart';

abstract class MissionEvent extends Equatable{
  const MissionEvent();
}

class GetMyMission extends MissionEvent{
  @override
  List<Object?> get props => [];
}
