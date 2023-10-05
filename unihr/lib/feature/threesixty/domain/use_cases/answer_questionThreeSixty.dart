import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/threesixty_entity.dart';
import '../repositories/threesixty_repository.dart';

class AnswerThreeSixtyUsecase {
  final ThreeSixtyRepository threeSixtyRepository;

  AnswerThreeSixtyUsecase(this.threeSixtyRepository);

  Future<Either<Failures, void>> call(
      List<AnswerQuestionToJson> answerList
      )async{
    return await threeSixtyRepository.answerQuestionThreeSixty(
      answerList,
    );
  }
}