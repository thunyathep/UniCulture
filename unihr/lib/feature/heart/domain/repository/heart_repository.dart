import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/heart/domain/entity/heart_entity.dart';

abstract class HeartRepository{
  Future<Either<Failures, List<HeartTransferEntity>>> getHeartTransfer();
  Future<Either<Failures, void>> sendHeartTransfer(
      int valueHeart,
      int idReceiver,
      int idSender,
      String detail,
      );
}
