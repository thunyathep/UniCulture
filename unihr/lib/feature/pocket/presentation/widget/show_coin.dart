import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/pocket/presentation/bloc/pocket_event.dart';

import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../../data/model/pocket_model.dart';
import '../bloc/pocket_bloc.dart';
import '../bloc/pocket_state.dart';


class ShowCoin extends StatefulWidget {
  const ShowCoin({Key? key}) : super(key: key);

  @override
  State<ShowCoin> createState() => _ShowCoinState();
}

class _ShowCoinState extends State<ShowCoin> {
  final PocketBloc _pocketBloc = PocketBloc();
  late ProfileProvider profileProvider;

  @override
  void initState() {
    profileProvider = ProfileProvider.of(context, listen: false);
    _pocketBloc.add(GetPocket());
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _pocketBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _pocketBloc,
      child: BlocBuilder<PocketBloc, PocketState>(
        builder: (context, state){
          if(state is PocketLoadingState){
            return Container(
              width: MediaQuery.of(context).size.width*0.35,
              height: MediaQuery.of(context).size.height*0.035,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/coin2.png',
                        width: MediaQuery.of(context).size.width*0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*3,
                        ),
                        child: Text(
                          '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/heart.png',
                        width: MediaQuery.of(context).size.width*0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*3,
                        ),
                        child: Text(
                          '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }else if (state is PocketLoadedState){
            return Container(
              width: MediaQuery.of(context).size.width*0.35,
              height: MediaQuery.of(context).size.height*0.035,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/coin2.png',
                        width: MediaQuery.of(context).size.width*0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*3,
                        ),
                        child: Text(
                          profileProvider.profileData.wallet![1].amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/heart.png',
                        width: MediaQuery.of(context).size.width*0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio*3,
                        ),
                        child: Text(
                          profileProvider.profileData.wallet![0].amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }else{
            return Text(state.props.toString());
          }
        },
      ),
    );
  }
}
