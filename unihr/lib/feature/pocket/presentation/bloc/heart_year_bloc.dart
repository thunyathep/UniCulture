import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/pocket/data/model/heart_receive_year_model.dart';
import '../../data/datasource/remote/heart_year_remote.dart';
import 'heart_year_event.dart';
import 'heart_year_state.dart';

class HeartYearBloc extends Bloc<HeartYearEvent, HeartYearState>{
  List<HeartYearModel> listheartyear = [];

  HeartYear_RemoteImpl heartYear_RemoteImpl = HeartYear_RemoteImpl(http.Client());

  HeartYearBloc() : super(InitialHeartYear()){
    on<GetHeartYear>((event, emit) async {
      emit(HeartYearLoadingState());
      try{
        final List<HeartYearModel> listheart =
        await heartYear_RemoteImpl.getHeartYear();
        final List<HeartYearModel> listHeartYear = listheart;
        print(listHeartYear);
        emit(HeartYearLoadedState(listHeartYear));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(HeartYearError(e.toString()));
      }
    });
  }
}