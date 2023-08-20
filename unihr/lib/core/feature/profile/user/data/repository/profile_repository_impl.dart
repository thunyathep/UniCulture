import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import '../../../../../error/failure.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/remote/profile_remote.dart';

class ProfileRepositoryImpl implements ProfileRepository{

  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, ProfileEntity>> getProfile() async{
    try {
      final data = await remoteDataSource.getProfile();
      return Right(data);
    } on SeverException {
      return Left(ServerFailure());
    }
  }
}