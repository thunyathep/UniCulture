import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';
import 'package:unihr/feature/reward/presentation/bloc/reward_event.dart';
import '../../../../injection_container.dart';
import '../../data/model/redeem_reward_model.dart';
import '../bloc/reward_bloc.dart';
import '../bloc/reward_state.dart';
import '../widget/cardAllReward.dart';
import '../widget/shimmer_myreward.dart';
import 'DetailReward.dart';

class AllReward extends StatefulWidget {
  const AllReward({Key? key}) : super(key: key);

  @override
  State<AllReward> createState() => _AllRewardState();
}

class _AllRewardState extends State<AllReward> {
  final RewardBloc _rewardBloc = sl<RewardBloc>();
  late List<RedeemRewardModel> listredeemreward;

  @override
  void initState() {
    _rewardBloc.add(GetRedeemReward(0));
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _rewardBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _rewardBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white
                                .withOpacity(0.0), // Start color with opacity
                            Colors.white
                                .withOpacity(1), // End color with opacity
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/trophy.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                          ShowCoin(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 17,
                          left: MediaQuery.of(context).devicePixelRatio * 17),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.18,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFCB0C2),
                                      Color(0xffF4BFCF),
                                      Color(0xffF0C5F1),
                                      Color(0xffE3DEF4),
                                      Color(0xffC1E1E7),
                                      Color(0xffC1E1E6),
                                    ]),
                                width: 4,
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/Unicorn.gif',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio * 5,
                            ),
                            child: const Text(
                              'สมพงศ์ จำปี',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 40,
                        left: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: const Text(
                        'แลกของรางวัล',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 8,
                        top: MediaQuery.of(context).devicePixelRatio * 50,
                        right: MediaQuery.of(context).devicePixelRatio * 8,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(0));
                              },
                              child: const Text(
                                "ทั้งหมด",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(1));
                              },
                              child: const Text(
                                "อาหาร",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(2));
                              },
                              child: const Text(
                                "ชอปปิง",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(3));
                              },
                              child: const Text(
                                "ความบันเทิง",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(4));
                              },
                              child: const Text(
                                "ไลฟ์สไตล์",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(5));
                              },
                              child: const Text(
                                "ท่องเที่ยว",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _rewardBloc.add(GetRedeemReward(6));
                              },
                              child: const Text(
                                "สุขภาพ",
                                style: TextStyle(
                                  color: Color(0xff757575),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<RewardBloc, RewardState>(builder: (context, state) {
                  if (state is RedeemRewardLoadingState) {
                    return ShimmerMyReward();
                  } else if (state is RedeemRewardLoadedState) {
                    listredeemreward = state.listRedeem;
                    return LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listredeemreward.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).devicePixelRatio * 7,
                              ),
                              child: CardAllReward(
                                  idCompanyReward: listredeemreward[index].idCompanyReward??0,
                                  name: listredeemreward[index].name??"",
                                  detail: listredeemreward[index].detail??"",
                                  image: listredeemreward[index].image??"",
                                  rewardManager: listredeemreward[index].rewardManager??"",
                                  contact: listredeemreward[index].contact??"",
                                  idRewardType: listredeemreward[index].idRewardType??0,
                                  items: listredeemreward[index].items??[],
                                  images: listredeemreward[index].images??[],
                                  options: listredeemreward[index].options??[],
                                  idUniReward: listredeemreward[index].idUniReward??0
                              ),
                            );
                          });
                    });
                  } else {
                    return Text('');
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
