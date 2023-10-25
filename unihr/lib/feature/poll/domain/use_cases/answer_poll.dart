import 'package:dartz/dartz.dart';
import 'package:unihr/feature/poll/domain/repositories/poll_repository.dart';
import '../../../../core/error/failure.dart';

class AnswerPollUsecase {
  final PollRepository pollRepository;

  AnswerPollUsecase(this.pollRepository);

  Future<Either<Failures, void>> call(
      int idEmployee,
      int idPoll,
      int idPollQuestion,
      )async{
    return await pollRepository.sendPoll(
      idEmployee,
      idPoll,
      idPollQuestion,
    );
  }
}