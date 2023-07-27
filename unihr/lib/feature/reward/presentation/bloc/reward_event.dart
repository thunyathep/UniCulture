import 'package:equatable/equatable.dart';

abstract class RewardEvent extends Equatable{
  const RewardEvent();
}

class GetMyReward extends RewardEvent{
  @override
  List<Object?> get props => [];
}

class GetRedeemReward extends RewardEvent{
  @override
  List<Object?> get props => [];
}