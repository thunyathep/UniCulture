import 'package:dartz/dartz.dart';
import 'package:unihr/core/feature/profile/user/domain/entity/all_user_profile_entity.dart';
import '../../../../../error/failure.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository{
  Future<Either<Failures , ProfileEntity>> getProfile();
  Future<Either<Failures, List<AllProfileEntity>>> getAllProfile(String query);
}