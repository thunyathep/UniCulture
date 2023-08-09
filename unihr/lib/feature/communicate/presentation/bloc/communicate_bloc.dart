import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/communicate/data/datasource/remote/communicate_remote.dart';
import 'package:unihr/feature/communicate/presentation/bloc/communicate_event.dart';
import 'package:unihr/feature/communicate/presentation/bloc/communicate_state.dart';

import '../../data/model/communicate_model.dart';

class CommunicateBloc extends Bloc<CommunicateEvent, CommunicateState>{
  List<CommunicateModel> listcommunicate= [];

  Communicate_remoteImpl communicate_remoteImpl =
    Communicate_remoteImpl(http.Client());

  CommunicateBloc() : super(InitialCommunicate()){
    on<GetCommunicate>((event, emit) async{
      emit(CommunicateLoadingState());
      try{
        final List<CommunicateModel> listcommunicate =
        await communicate_remoteImpl.getCommunicate();
        final List<CommunicateModel> listCommunicate = listcommunicate;
        emit(CommunicateLoadedState(listCommunicate));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(CommunicateError(e.toString()));
      }
    });
  }
}