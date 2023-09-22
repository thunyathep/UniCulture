import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/activity_repository.dart';

class UnRegisterActivityUsecase {
  final ActivityRepository activityRepository;

  UnRegisterActivityUsecase(this.activityRepository);

  Future<Either<Failures, void>> call(
      int idActivity,
      int idEmployee,
      )async{
    return await activityRepository.unregisterActivity(
      idActivity,
      idEmployee,
    );
  }
}