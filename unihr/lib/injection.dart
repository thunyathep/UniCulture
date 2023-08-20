import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'core/feature/profile/user/data/datasource/remote/profile_remote.dart';
import 'core/feature/profile/user/data/repository/profile_repository_impl.dart';
import 'core/feature/profile/user/domain/usecase/get_profile.dart';
import 'core/feature/profile/user/presentation/profile_provider.dart';



class Injection extends StatelessWidget {
  final Widget? router;
  const Injection({super.key, this.router});

  @override
  Widget build(BuildContext context) =>
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProfileProvider(
              getProfile: GetProfile(
                  repository: ProfileRepositoryImpl(
                      remoteDataSource: ProfileRemoteDataSourceImpl(
                          client: http.Client()))))),



          /* * Manager * */
          // ChangeNotifierProvider(create: (context) => ManagerProfileProvider(
          //     getManagerProfile: GetManagerProfile(
          //         repository: ManagerProfileRepositoryImpl(
          //             remoteDataSource: ManagerProfileRemoteDataSourceImpl(
          //                 client: http.Client()))))),
        ],
        child: router,
      );
}
