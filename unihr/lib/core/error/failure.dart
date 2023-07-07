import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{
  Failures([List properties = const <dynamic>[]]): super();
}

class ServerFailure extends Failures{
  @override
  List<Object?> get props => throw UnimplementedError();
}