import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/communicate/data/datasource/remote/communicate_remote.dart';
import 'package:unihr/feature/communicate/data/model/communicate_model.dart';
import 'package:unihr/feature/communicate/domain/repository/communicate_repository.dart';

class CommunicateRepositoryImpl implements CommunicateRepository{
  final Communicate_remote communicate_remote;

  CommunicateRepositoryImpl(this.communicate_remote);

  @override
  Future<Either<Failures, List<CommunicateModel>>> getCommunicate()async{
    try{
      final communicate = await communicate_remote.getCommunicate();
      return Right(communicate);
    }on SeverException{
      return Left(ServerFailure());
    }
  }
}