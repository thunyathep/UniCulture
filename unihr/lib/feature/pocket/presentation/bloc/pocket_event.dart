import 'package:equatable/equatable.dart';

abstract class PoketEvent extends Equatable{
  const PoketEvent();
}

class GetPoket extends PoketEvent{
  @override
  List<Object?> get props => [];
}