import 'package:dartz/dartz.dart';
import 'package:unihr/feature/heart/domain/entity/heart_entity.dart';
import 'package:unihr/feature/heart/domain/repository/heart_repository.dart';
import '../../../../core/error/failure.dart';

class SendHeartTransfer {
  final HeartRepository heartRepository;

  SendHeartTransfer(this.heartRepository);

  Future<Either<Failures, void>> call(
      int valueHeart,
      int idReceiver,
      int idSender,
      String detail,
      )async{
    return await heartRepository.sendHeartTransfer(
        valueHeart,
        idReceiver,
        idSender,
        detail
    );
  }
}