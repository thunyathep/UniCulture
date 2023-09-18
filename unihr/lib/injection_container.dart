import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/heart/data/datasource/remote/heart_remote.dart';
import 'package:unihr/feature/heart/data/repository/heart_repository_impl.dart';
import 'package:unihr/feature/heart/domain/repository/heart_repository.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_bloc.dart';

import 'core/feature/login/data/datasource/remote/login_remote.dart';
import 'core/feature/login/data/repository/login_repository_impl.dart';
import 'core/feature/login/domain/repository/login_repository.dart';
import 'core/feature/login/domain/usecase/login_usecase.dart';
import 'core/feature/login/presentation/bloc/login_bloc.dart';
import 'feature/heart/domain/usecase/send_heart_transfer.dart';



final sl = GetIt.instance;

Future<void> init() async{

  // * Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(),));
  sl.registerFactory(()=> HeartBloc(sendHeartTransfer: sl()));


  // * UseCase
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => SendHeartTransfer(sl()));
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
  sl.registerLazySingleton<HeartRepository>(() => HeartRepositoryImpl(sl()));
  // * Data Source
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(client: sl()));
  sl.registerLazySingleton<Heart_remote>(() => Heart_remoteImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

}