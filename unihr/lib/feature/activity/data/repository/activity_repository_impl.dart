import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/exception.dart';
import 'package:unihr/core/error/failure.dart';
import 'package:unihr/feature/activity/data/datasource/remote/activity_remote.dart';
import 'package:unihr/feature/activity/data/model/myactivity_model.dart';
import 'package:unihr/feature/activity/domain/repository/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository{
  final Activity_remote activity_remote;

  ActivityRepositoryImpl(this.activity_remote);

  @override
  Future<Either<Failures, List<MyActivityModel>>> getMyActivity()async{
    try{
      final activity = await activity_remote.getMyActivity();
      return Right(activity);
    }on SeverException{
      return Left(ServerFailure());
    }
  }
}