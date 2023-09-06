import 'package:dartz/dartz.dart';
import 'package:unihr/feature/question/domain/repository/moralediary_repository.dart';
import '../../../../core/error/failure.dart';



class SendAnswerDiaryUsecase {
  final MoraleRepository moraleRepository;
  SendAnswerDiaryUsecase(this.moraleRepository);

  Future<Either<Failures, void>> call(
      int idEmployee,
      int idMoraledaily,
      String answer,
      DateTime answerDate,
      String firstName,
      String lastName,
      ) async {
    return await moraleRepository.sendAnswerDiary(
      idEmployee,
      idMoraledaily,
      answer,
      answerDate,
      firstName,
      lastName,
    );
  }
}