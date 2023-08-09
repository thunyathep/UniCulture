import 'package:equatable/equatable.dart';

abstract class CommunicateEvent extends Equatable{
  const CommunicateEvent();
}

class GetCommunicate extends CommunicateEvent{
  @override
  List<Object?> get props => [];
}
