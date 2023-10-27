import 'package:equatable/equatable.dart';

abstract class ScoreEvent extends Equatable{
  const ScoreEvent();
}

class GetScore extends ScoreEvent{
  int status;
  GetScore(this.status);
  @override
  List<Object> get props => [];
}
