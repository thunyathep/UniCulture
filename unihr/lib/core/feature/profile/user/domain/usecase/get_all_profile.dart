import 'package:dartz/dartz.dart';
import '../../../../../error/failure.dart';
import '../entity/all_user_profile_entity.dart';
import '../repository/profile_repository.dart';

class GetAllProfile{
  final ProfileRepository repository;
  GetAllProfile({required this.repository});

  Future<Either<Failures, AllProfileEntity>> call() async {
    return await repository.getAllProfile();
  }
}