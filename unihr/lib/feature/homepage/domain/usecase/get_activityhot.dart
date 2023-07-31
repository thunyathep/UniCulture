import 'package:dartz/dartz.dart';
import 'package:unihr/feature/homepage/domain/entity/activity_entity.dart';
import 'package:unihr/feature/homepage/domain/repository/homepage_repository.dart';

import '../../../../core/error/failure.dart';


class GetActivity{
  final HomepageRepository homepageRepository;

  GetActivity(this.homepageRepository);

  Future<Either<Failures, List<ActivityEntity>>> execute() async =>
      await homepageRepository.getActivity();
}