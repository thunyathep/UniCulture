import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/heart/data/datasource/remote/heart_remote.dart';
import 'package:unihr/feature/heart/data/model/heart_model.dart';
import 'package:unihr/feature/heart/domain/usecase/send_heart_transfer.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_event.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_state.dart';

import '../../../../core/storage/secure_storage.dart';
import '../../domain/repository/heart_repository.dart';



class HeartBloc extends Bloc<HeartEvent, HeartState> {
  List<HeartTransferModel> listheart = [];
  Heart_remoteImpl heart_remoteImpl = Heart_remoteImpl(http.Client());
  SendHeartTransfer sendHeartTransfer;


  HeartBloc({required this.sendHeartTransfer}) : super(InitialHeart()) {
    on<GetHeart>((event, emit) async {
      emit(HeartLoadingState());
      try {
        int idUser = int.parse(await LoginStorage.readEmployeeId());
        List<HeartTransferModel> listHeart = await heart_remoteImpl.getHeartTransfer();
        if(event.status == 0){
          listHeart = listHeart.where((element) =>
          element.idReceiver == idUser).toList();
          listheart = listHeart;
        }else if(event.status == 1){
          listHeart = listHeart.where((element) =>
          element.idSender == idUser).toList();
          listheart = listHeart;
        }
        emit(HeartLoadedState(listHeart));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(HeartError(e.toString()));
      }
    });

    on<GetValueHeart>((event, emit) async {
      emit(HeartLoadingState());
      try {
        int idUser = int.parse(await LoginStorage.readEmployeeId());
        List<HeartTransferModel> listHeart = listheart;
        if(event.valueheart == 0){
          event.status == 0 ? listHeart = listHeart.where((element) =>
          element.idReceiver == idUser).toList():
          listHeart = listHeart.where((element) =>
          element.idSender == idUser).toList();
        }else if(event.valueheart == 1){
          listHeart = listHeart.where((element) =>
          element.value == 1).toList();
        }else if(event.valueheart == 2){
          listHeart = listHeart.where((element) =>
          element.value == 2).toList();
        }else if(event.valueheart == 3){
          listHeart = listHeart.where((element) =>
          element.value == 3).toList();
        }
        emit(HeartLoadedState(listHeart));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(HeartError(e.toString()));
      }
    });

    on<SendingHeart>((event, emit) async {
      emit(HeartSendingState());
      var response = await sendHeartTransfer(
        event.valueHeart,
        event.idReceiver,
        event.idSender,
        event.detail,
      );
      response.fold(
              (l) => emit(HeartError("Something wrong")),
              (r) => emit(HeartSendingSuccessState()));
    });
  }
}

