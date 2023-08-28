import 'package:dartz/dartz.dart';
import 'package:unihr/feature/question/domain/entity/question_entity.dart';
import 'package:unihr/feature/question/domain/repository/question_repository.dart';
import '../../../../core/error/failure.dart';

class GetQuestion {
  final QuestionRepository questionRepository;

  GetQuestion(this.questionRepository);

  Future<Either<Failures, List<QuestionEntity>>> execute() async =>
      await questionRepository.getQuestion();
}