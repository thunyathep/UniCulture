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
  String? reply;
  int valueHeart;
  int idReceiver;
  String detail;
  // DateTime transferDate;

  SendingHeart(this.reply, this.valueHeart, this.idReceiver, this.detail);

  @override
  List<Object?> get props => [];
}