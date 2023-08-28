import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/question/domain/entity/question_entity.dart';


abstract class QuestionRepository{
  Future<Either<Failures, List<QuestionEntity>>> getQuestion();
}