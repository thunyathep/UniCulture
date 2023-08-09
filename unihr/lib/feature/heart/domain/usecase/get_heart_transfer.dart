import 'package:dartz/dartz.dart';
import 'package:unihr/feature/heart/domain/entity/heart_entity.dart';
import 'package:unihr/feature/heart/domain/repository/heart_repository.dart';
import '../../../../core/error/failure.dart';

class GetHeartTransfer {
  final HeartRepository heartRepository;

  GetHeartTransfer(this.heartRepository);

  Future<Either<Failures, List<HeartTransferEntity>>> execute() async =>
      await heartRepository.getHeartTransfer();
}