import 'package:dartz/dartz.dart';
import 'package:unihr/core/error/failure.dart';

import '../entity/login_entity.dart';
import '../repository/login_repository.dart';


class LoginUseCase{
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failures, LoginEntity>> call(String username,String password) async {
    return await repository.login(username,password);
  }
}
