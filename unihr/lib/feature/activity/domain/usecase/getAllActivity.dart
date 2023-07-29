import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/activity/data/model/allactivity_model.dart';

import '../repository/activity_repository.dart';

class GetAllActivity{
  final ActivityRepository activityRepository;

  GetAllActivity(this.activityRepository);

  Future<Either<Failures, List<AllActivityModel>>> execute() async =>
      await activityRepository.getAllActivity();
}