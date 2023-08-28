import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/feature/question/data/datasource/remote/question_remote.dart';
import 'package:unihr/feature/question/data/model/question_model.dart';
import 'package:unihr/feature/question/domain/repository/question_repository.dart';
import '../../../../core/error/failure.dart';

class QuestionRepositoryImpl implements QuestionRepository{
  final Question_remote question_remote;

  QuestionRepositoryImpl(this.question_remote);

  @override
  Future<Either<Failures, List<QuestionModel>>> getQuestion() async {
    try{
      final question = await question_remote.getQuestion();
      return Right(question);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}