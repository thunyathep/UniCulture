import 'package:dartz/dartz.dart';
import '../../../../error/exception.dart';
import '../../../../error/failure.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/repository/login_repository.dart';
import '../datasource/remote/login_remote.dart';



class LoginRepositoryImpl implements LoginRepository{
  final LoginApi loginApi;
  LoginRepositoryImpl({required this.loginApi});
  @override
  Future<Either<Failures, LoginEntity>> login(String username, String password) async{
    try{
      final data = await loginApi.login(username, password);
      return Right(data);
    } on SeverException{
      return Left(ServerFailure());
    }
  }
}