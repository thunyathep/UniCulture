import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/activity/data/datasource/remote/activity_remote.dart';
import 'package:unihr/feature/activity/domain/repository/activity_repository.dart';
import 'package:unihr/feature/feedback/data/datasource/remote/feedback_remote.dart';
import 'package:unihr/feature/feedback/data/repository/feedback_repository_impl.dart';
import 'package:unihr/feature/feedback/domain/repository/feedback_repositories.dart';
import 'package:unihr/feature/feedback/domain/usecase/send_feedback.dart';
import 'package:unihr/feature/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:unihr/feature/heart/data/datasource/remote/heart_remote.dart';
import 'package:unihr/feature/heart/data/repository/heart_repository_impl.dart';
import 'package:unihr/feature/heart/domain/repository/heart_repository.dart';
import 'package:unihr/feature/heart/presentation/bloc/heart_bloc.dart';
import 'package:unihr/feature/reward/data/datasource/remote/myreward_remote.dart';
import 'package:unihr/feature/reward/data/repository/myreward_repository_impl.dart';
import 'package:unihr/feature/reward/domain/usecase/redeemed_reward.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_bloc.dart';
import 'package:unihr/feature/threesixty/data/data_sources/remote/threesixty_remote.dart';
import 'package:unihr/feature/threesixty/data/repositories/threesixty_repository_impl.dart';
import 'package:unihr/feature/threesixty/domain/repositories/threesixty_repository.dart';
import 'package:unihr/feature/threesixty/domain/use_cases/answer_questionThreeSixty.dart';
import 'package:unihr/feature/threesixty/presentation/bloc/threesixty_bloc.dart';

import 'core/feature/login/data/datasource/remote/login_remote.dart';
import 'core/feature/login/data/repository/login_repository_impl.dart';
import 'core/feature/login/domain/repository/login_repository.dart';
import 'core/feature/login/domain/usecase/login_usecase.dart';
import 'core/feature/login/presentation/bloc/login_bloc.dart';
import 'feature/activity/data/repository/activity_repository_impl.dart';
import 'feature/activity/domain/usecase/register_activitiy.dart';
import 'feature/activity/domain/usecase/unregis_activity.dart';
import 'feature/activity/presentation/bloc/activity_bloc.dart';
import 'feature/heart/domain/usecase/send_heart_transfer.dart';
import 'feature/reward/domain/repository/myreward_repository.dart';



final sl = GetIt.instance;

Future<void> init() async{

  // * Bloc
  sl.registerFactory(() => LoginBloc(loginUseCase: sl(),));
  sl.registerFactory(()=> HeartBloc(sendHeartTransfer: sl()));
  sl.registerFactory(()=> ActivityBloc(registerActivityUsecase: sl(),
      unRegisterActivityUsecase: sl()));
  sl.registerFactory(()=> FeedbackBloc(sendFeedbackUsecase: sl()));
  sl.registerFactory(()=> ThreeSixtyBloc(answerThreeSixtyUsecase: sl()));
  sl.registerFactory(()=> RewardBloc(redeemRewardUsecase: sl()));



  // * UseCase
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => SendHeartTransfer(sl()));
  sl.registerLazySingleton(() => RegisterActivityUsecase(sl()));
  sl.registerLazySingleton(() => UnRegisterActivityUsecase(sl()));
  sl.registerLazySingleton(() => SendFeedbackUsecase(sl()));
  sl.registerLazySingleton(() => AnswerThreeSixtyUsecase(sl()));
  sl.registerLazySingleton(() => RedeemRewardUsecase(sl()));
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
  sl.registerLazySingleton<ActivityRepository>(() => ActivityRepositoryImpl(sl()));
  sl.registerLazySingleton<FeedBackRepositories>(() => FeedBackRepositoryImpl(sl()));
  sl.registerLazySingleton<ThreeSixtyRepository>(() => ThreeSixtyRepositoryImpl(sl()));
  sl.registerLazySingleton<MyRewardRepository>(() => MyRewardRepositoryImpl(sl()));

  // * Data Source
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(client: sl()));
  sl.registerLazySingleton<Heart_remote>(() => Heart_remoteImpl(sl()));
  sl.registerLazySingleton<Activity_remote>(() => Activity_remoteImpl(sl()));
  sl.registerLazySingleton<Feedback_remote>(() => Feedback_remoteImpl(sl()));
  sl.registerLazySingleton<ThreeSixty_remote>(() => ThreeSixty_remoteImpl(sl()));
  sl.registerLazySingleton<MyReward_remote>(() => MyReward_remoteImpl(sl()));


  sl.registerLazySingleton(() => http.Client());

}