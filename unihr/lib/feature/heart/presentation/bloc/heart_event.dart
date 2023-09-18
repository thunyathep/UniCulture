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

class SendingHeart extends HeartEvent{
  int idSender;
  int valueHeart;
  int idReceiver;
  String detail;
  // DateTime transferDate;

  SendingHeart({
    required this.idSender,
    required this.valueHeart,
    required this.idReceiver,
    required this.detail});

  @override
  List<Object?> get props => [
    idSender,
    valueHeart,
    idReceiver,
    detail,
  ];
}