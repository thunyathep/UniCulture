import 'package:dartz/dartz.dart';
import 'package:unihr/feature/reward/domain/repository/myreward_repository.dart';
import '../../../../core/error/failure.dart';
import '../entity/redeem_reward_entity.dart';


class RedeemRewardUsecase {
  final MyRewardRepository myRewardRepository;

  RedeemRewardUsecase(this.myRewardRepository);

  Future<Either<Failures, void>> call(
      List<CoinRedeem> coins,
      int idEmployee,
      int quantity,
      )async{
    return await myRewardRepository.redeemedReward(
      coins,
      idEmployee,
      quantity,
    );
  }
}