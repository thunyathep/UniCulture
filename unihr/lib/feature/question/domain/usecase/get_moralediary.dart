import 'package:dartz/dartz.dart';
import 'package:unihr/feature/question/domain/entity/moralediary_entity.dart';
import '../../../../core/error/failure.dart';
import '../repository/moralediary_repository.dart';


class GetMoraleDiary {
  final MoraleRepository moraleRepository;

  GetMoraleDiary(this.moraleRepository);

  Future<Either<Failures, List<MoraleDiaryEntity>>> execute() async =>
      await moraleRepository.getMoraleDiary();
}