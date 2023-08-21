import 'package:equatable/equatable.dart';

abstract class HeartYearEvent extends Equatable{
  const HeartYearEvent();
}

class GetHeartYear extends HeartYearEvent{
  @override
  List<Object?> get props => [];
}