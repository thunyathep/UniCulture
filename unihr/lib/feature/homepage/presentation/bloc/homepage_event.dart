import 'package:equatable/equatable.dart';

abstract class HomepageEvent extends Equatable{
  const HomepageEvent();
}

class GetReward extends HomepageEvent{
  @override
  List<Object?> get props => [];
}
