import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/threesixty/data/data_sources/remote/threesixty_remote.dart';
import 'package:unihr/feature/threesixty/data/models/threesixty_model.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_event.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_state.dart';


class ThreeSixtyBloc extends Bloc<ThreeSixtyEvent, ThreeSixtyState>{
  List<ThreeSixtyModel> listQuestion = [];
  ThreeSixty_remoteImpl threeSixty_remoteImpl = ThreeSixty_remoteImpl(http.Client());

  ThreeSixtyBloc() : super(InitialThreeSixty()){

    on<GetQuestionThreeSixtyEvent>((event, emit) async {
      emit(ThreeSixtyLoadingState());
      try{
        final List<ThreeSixtyModel> listQuestionThreeSixty = await threeSixty_remoteImpl.getQuestionThreeSixty();
        final List<ThreeSixtyModel> listquestion = listQuestionThreeSixty;
        emit(ThreeSixtyLoadedState(listquestion));
      }catch(e, stracktrace){
        print("Exception occurred: $e stracktrace: $stracktrace");
        emit(ThreeSixtyError(e.toString()));
      }
    });
  }
}