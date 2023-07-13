import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{
  Failures([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failures{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheException implements Exception {}