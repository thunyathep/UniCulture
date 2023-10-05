import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/threesixty/data/data_sources/remote/threesixty_remote.dart';
import 'package:unihr/feature/threesixty/data/models/threesixty_model.dart';

import '../../domain/entities/threesixty_entity.dart';
import '../../domain/repositories/threesixty_repository.dart';


class ThreeSixtyRepositoryImpl implements ThreeSixtyRepository{
  final ThreeSixty_remote threeSixty_remote;

  ThreeSixtyRepositoryImpl(this.threeSixty_remote);

  @override
  Future<Either<Failures,List<ThreeSixtyModel>>> getQuestionThreeSixty() async {
    try{
      final question = await threeSixty_remote.getQuestionThreeSixty();
      return Right(question);
    } on SeverException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, void>> answerQuestionThreeSixty(
      List<AnswerQuestionToJson> answerList,
      )async{
    try{
      final data = await threeSixty_remote.AnswerQuestionThreeSixty(
        answerList
      );
      return Right(data);
    } on SeverException {
      return left(ServerFailure());
    }
  }
}