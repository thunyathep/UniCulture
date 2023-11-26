import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/dashboard/data/data_sources/remote/dashboard_remote.dart';
import 'package:unihr/feature/dashboard/data/models/dashboard_model.dart';
import 'package:unihr/feature/dashboard/presentation/bloc/dashboard_event.dart';

import '../../domain/use_cases/getDashboard.dart';
import 'dashboard_state.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashBoardState> {
  List<DashboardModel> listDashboard = [];
  Dashboard_remoteImpl dashboard_remoteImpl = Dashboard_remoteImpl(http.Client());
  // GetDashboardUsecase getDashboardUsecase;


  DashboardBloc() : super(InitialDashboard()) {
    on<GetDashBoard>((event, emit) async {
      emit(DashboardLoadingState());
      try {
        final List<DashboardModel> listDashboard = await dashboard_remoteImpl.getDashboard();
        final List<DashboardModel> listdashboard = listDashboard;
        emit(DashboardLoadedState(listdashboard));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(DashboardError(e.toString()));
      }
    });
    //
    // on<SendingFeedBackEvent>((event, emit) async {
    //   emit(SendingFeedBackState());
    //   var response = await sendFeedbackUsecase(
    //     event.feedback,
    //     event.feedbackType,
    //     event.idReceiver,
    //     event.idSender,
    //   );
    //   response.fold(
    //           (l) => emit(ErrorFeedback("Something wrong")),
    //           (r) => emit(SendedFeedBackState()));
    // });
  }
}

