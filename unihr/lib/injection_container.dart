import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/feature/login/data/datasource/remote/login_remote.dart';
import 'core/feature/login/data/repository/login_repository_impl.dart';
import 'core/feature/login/domain/repository/login_repository.dart';
import 'core/feature/login/domain/usecase/login_usecase.dart';
import 'core/feature/login/presentation/bloc/login_bloc.dart';



final sl = GetIt.instance;

Future<void> init() async{

  // * Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(),));


  // * UseCase
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetProfile(repository: sl()));


  // ! WaitingStatus Manager
  // sl.registerLazySingleton(() => GetLeaveRequestManager(repository: sl()));
  // sl.registerLazySingleton(() => GetRequestTimeManager(repository: sl()));
  // sl.registerLazySingleton(() => GetWithdrawLeaveManager(repository: sl()));
  // sl.registerLazySingleton(() => GetChangeTimeManager(repository: sl()));
  // sl.registerLazySingleton(() => GetPayrollSettingManager(repository: sl()));
  // sl.registerLazySingleton(() => IsLeaveApprove(repository: sl()));

  // * Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginApi: sl()));

  // * Data Source
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(client: sl()));

  sl.registerLazySingleton(() => http.Client());

}