import 'package:equatable/equatable.dart';

import '../../domain/entity/redeem_reward_entity.dart';

abstract class RewardEvent extends Equatable{
  const RewardEvent();
}

class GetMyReward extends RewardEvent{
  @override
  List<Object?> get props => [];
}

class GetRedeemReward extends RewardEvent{
  int status;

  GetRedeemReward(this.status);

  @override
  List<Object?> get props => [];
}

class GetRedeemRewardHomePage extends RewardEvent{
  @override
  List<Object?> get props => [];
}

class GetMyRewardClick extends RewardEvent{
  int status;
  GetMyRewardClick(this.status);
  @override
  List<Object?> get props => [];
}

class RedeemedReward extends RewardEvent{
  List<CoinRedeem> coins;
  int idEmployee;
  int quantity;

  RedeemedReward({
    required this.coins,
    required this.idEmployee,
    required this.quantity,
  });

  @override
  List<Object?> get props => [];
}