import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';
import 'package:unihr/feature/activity/domain/repository/activity_repository.dart';

class GetMyActivity{
  final ActivityRepository activityRepository;

  GetMyActivity(this.activityRepository);

  Future<Either<Failures, List<MyActivityModel>>> execute() async =>
      await activityRepository.getMyActivity();
}