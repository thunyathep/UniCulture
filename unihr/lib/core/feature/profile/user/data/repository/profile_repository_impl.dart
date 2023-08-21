import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/feature/profile/user/domain/entity/all_user_profile_entity.dart';
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

  @override
  Future<Either<Failures, AllProfileEntity>> getAllProfile() async{
    try {
      final data = await remoteDataSource.getAllProfile();
      return Right(data);
    } on SeverException {
      return Left(ServerFailure());
    }
  }
}