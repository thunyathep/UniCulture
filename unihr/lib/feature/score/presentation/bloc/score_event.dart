import 'package:equatable/equatable.dart';

abstract class ScoreEvent extends Equatable{
  const ScoreEvent();
}


class GetScoreHeart extends ScoreEvent{
  @override
  List<Object> get props => [];
}

class GetScoreCoin extends ScoreEvent{
  @override
  List<Object> get props => [];
}