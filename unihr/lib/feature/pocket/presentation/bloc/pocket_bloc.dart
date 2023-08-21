import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/pocket/data/datasource/remote/poket_remote.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_state.dart';

import '../../data/model/pocket_model.dart';
import '../../data/repository/heart_year_repository_impl.dart';

class PocketBloc extends Bloc<PocketEvent, PocketState>{
  List<PocketModel> listcoin = [];
  List<HeartYearModel> listheartyear = [];

  Pocket_remoteImpl pocket_remoteImpl = Pocket_remoteImpl(http.Client());

  PocketBloc() : super(InitialPocket()){
    on<GetPocket>((event, emit) async {
      emit(PocketLoadingState());
      try{
        final List<PocketModel> listcoin =
            await pocket_remoteImpl.getPocket();
        final List<PocketModel> listCoin = listcoin;
        emit(PocketLoadedState(listCoin));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(PocketError(e.toString()));
      }
    });

  }
}