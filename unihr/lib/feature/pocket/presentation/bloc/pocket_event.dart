import 'package:equatable/equatable.dart';

abstract class PocketEvent extends Equatable{
  const PocketEvent();
}

class GetPocket extends PocketEvent{
  @override
  List<Object?> get props => [];
}