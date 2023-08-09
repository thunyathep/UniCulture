import 'package:equatable/equatable.dart';

abstract class HeartEvent extends Equatable{
  const HeartEvent();
}

class GetHeart extends HeartEvent{
  int status;
  GetHeart(this.status);

  @override
  List<Object?> get props => [];
}