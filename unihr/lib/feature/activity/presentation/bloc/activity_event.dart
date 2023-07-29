import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable{
  const ActivityEvent();
}

class GetMyActivity extends ActivityEvent{
  @override
  List<Object?> get props => [];
}
class GetAllActivity extends ActivityEvent{
  @override
  List<Object?> get props => [];
}