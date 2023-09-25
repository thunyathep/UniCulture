import 'package:dartz/dartz.dart';
import 'package:unihr/feature/threesixty/domain/entities/threesixty_entity.dart';

import '../../../../core/error/failure.dart';
import '../repositories/threesixty_repository.dart';


class GetQuestionThreeSixty{
  final ThreeSixtyRepository threeSixtyRepository;

  GetQuestionThreeSixty(this.threeSixtyRepository);

  Future<Either<Failures, List<ThreeSixtyEntity>>> execute() async =>
      await threeSixtyRepository.getQuestionThreeSixty();
}