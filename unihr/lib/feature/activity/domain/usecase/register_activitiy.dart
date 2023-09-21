import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/activity_repository.dart';

class RegisterActivityUsecase {
  final ActivityRepository activityRepository;

  RegisterActivityUsecase(this.activityRepository);

  Future<Either<Failures, void>> call(
      int idActivity,
      int idEmployee,
      )async{
    return await activityRepository.registerActivity(
        idActivity,
        idEmployee,
    );
  }
}