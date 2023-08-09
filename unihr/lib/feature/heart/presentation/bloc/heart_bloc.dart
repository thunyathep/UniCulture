import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/heart/data/datasource/remote/heart_remote.dart';
import 'package:unihr/feature/heart/data/model/heart_model.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_event.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_state.dart';



class HeartBloc extends Bloc<HeartEvent, HeartState> {
  List<HeartTransferModel> listheart = [];
  Heart_remoteImpl heart_remoteImpl = Heart_remoteImpl(http.Client());


  HeartBloc() : super(InitialHeart()) {
    on<GetHeart>((event, emit) async {
      emit(HeartLoadingState());
      try {
        List<HeartTransferModel> listHeart = await heart_remoteImpl.getHeartTransfer();
        if(event.status == 0){
          listHeart = listHeart.where((element) =>
          element.idReceiver == 10068989).toList();
        }else if(event.status == 1){
          listHeart = listHeart.where((element) =>
          element.idSender == 10068989).toList();
        }
        emit(HeartLoadedState(listHeart));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(HeartError(e.toString()));
      }
    });
  }
}

