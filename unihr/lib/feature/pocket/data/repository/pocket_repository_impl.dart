import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/pocket/data/model/pocket_model.dart';
import 'package:unihr/feature/pocket/domain/repository/pocket_repository.dart';

import '../datasource/remote/poket_remote.dart';


class PocketRepositoryImpl implements PocketRepository{
  final Pocket_remote pocket_remote;

  PocketRepositoryImpl(this.pocket_remote);

  @override
  Future<Either<Failures, List<PocketModel>>> getPocket() async{
    try{
      final coin = await pocket_remote.getPocket();
      return Right(coin);
    }on SeverException{
      return Left(ServerFailure());
    }
  }
}