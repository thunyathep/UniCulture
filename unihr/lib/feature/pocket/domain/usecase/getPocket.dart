import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/pocket/data/model/pocket_model.dart';

import '../repository/pocket_repository.dart';


class GetPocket{
  final PocketRepository pocketRepository;

  GetPocket(this.pocketRepository);

  Future<Either<Failures, List<PocketModel>>> execute() async =>
      await pocketRepository.getPocket();
}