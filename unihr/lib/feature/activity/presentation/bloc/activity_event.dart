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

class GetMyActivityStatus extends ActivityEvent{
  int status;

  GetMyActivityStatus(this.status);

  @override
  List<Object?> get props => [];
}

class GetCardActivityHomePage extends ActivityEvent{
  @override
  List<Object?> get props => [];
}

class RegisterActivity extends ActivityEvent{
    int idActivity;
    int idEmployee;

    RegisterActivity({
    required this.idActivity,
    required this.idEmployee,
    });

  @override
  List<Object?> get props => [
    idActivity,
    idEmployee,
  ];
}

class UnRegisterActivity extends ActivityEvent{
  int idActivity;
  int idEmployee;

  UnRegisterActivity({
    required this.idActivity,
    required this.idEmployee,
  });

  @override
  List<Object?> get props => [
    idActivity,
    idEmployee,
  ];
}