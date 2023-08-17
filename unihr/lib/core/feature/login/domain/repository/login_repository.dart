import 'package:dartz/dartz.dart';

import '../../../../error/failure.dart';
import '../entity/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failures, LoginEntity>> login(String username ,String password);
}