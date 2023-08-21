import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/pocket/domain/repository/heart_recieve_year_repository.dart';

import '../../data/model/heart_receive_year_model.dart';


class GetHeartYear{
  final HeartReceiveYearRepository heartReceiveYearRepository;

  GetHeartYear(this.heartReceiveYearRepository);

  Future<Either<Failures, List<HeartYearModel>>> execute() async =>
      await heartReceiveYearRepository.getHeartYear();
}