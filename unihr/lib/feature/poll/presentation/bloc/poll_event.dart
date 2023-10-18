import 'package:equatable/equatable.dart';

abstract class PollEvent extends Equatable{
  const PollEvent();
}

class GetPoll extends PollEvent{
  @override
  List<Object?> get props => [];
}