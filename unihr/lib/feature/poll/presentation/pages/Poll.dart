import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:unihr/feature/poll/data/models/poll_model.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_bloc.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_state.dart';
import 'dart:math' as math;

import '../../../../core/feature/profile/user/presentation/profile_provider.dart';
import '../../../pocket/presentation/widget/show_coin.dart';
import '../bloc/poll_event.dart';
import '../widgets/cardPoll.dart';

class PollPage extends StatefulWidget {
  const PollPage({Key? key}) : super(key: key);

  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  final PollBloc _pollBloc = PollBloc();
  late ProfileProvider profileProvider;
  late List<Poll_Model> listpoll;

  @override
  void initState() {
    _pollBloc.add(GetPoll());
    profileProvider = ProfileProvider.of(context, listen: false);
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    _pollBloc.close();
    super.dispose();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PollBloc>(
              create: (_) => _pollBloc,
            ),
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
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
                      child: Transform.rotate(
                        angle: 2 * math.pi / 180,
                        child: Image.asset(
                          'assets/poll.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.27,
                          fit: BoxFit.contain,
                        ),
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
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              height: MediaQuery.of(context).size.height * 0.03,
                              child: Text(
                                "${profileProvider.profileData.firstName ?? "ไม่ระบุ"}" +
                                    " " +
                                    "${profileProvider.profileData.lastName ?? "ไม่ระบุ"}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 50,
                        left: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'โหวตโพล',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 5,
                        bottom: MediaQuery.of(context).devicePixelRatio * 5,
                      ),
                      child: Text(
                        "Open",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    BlocBuilder<PollBloc, PollState>(
                        builder: (context, state) {
                          if (state is PollLoadingState) {
                            return Text("");
                          } else if (state is PollLoadedState) {
                            listpoll = state.listpoll;
                            return LayoutBuilder(builder:
                                (BuildContext context, BoxConstraints constraints) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height*0.3,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listpoll.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.all(
                                          MediaQuery.of(context).devicePixelRatio * 7,
                                        ),
                                        child: Card_Poll(
                                            idPoll: listpoll[index].idPoll??0,
                                            poll: listpoll[index].poll??"",
                                            endDate: listpoll[index].endDate??DateTime.now(),
                                            status: listpoll[index].status??"",
                                            questionPollList: listpoll[index].questionPollList,
                                            voterList: listpoll[index].voterList,
                                        ),
                                      );
                                    }),
                              );
                            });
                          } else {
                            return Text(state.props.toString());
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 5,
                        bottom: MediaQuery.of(context).devicePixelRatio * 5,
                      ),
                      child: Text(
                        "Ended",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // BlocBuilder<PollBloc, PollState>(
                    //     builder: (context, state) {
                    //       if (state is PollLoadingState) {
                    //         return Text("");
                    //       } else if (state is PollLoadedState) {
                    //         listpoll = state.listpoll;
                    //         return LayoutBuilder(builder:
                    //             (BuildContext context, BoxConstraints constraints) {
                    //           return ListView.builder(
                    //               shrinkWrap: true,
                    //               physics: const NeverScrollableScrollPhysics(),
                    //               itemCount: listpoll.length,
                    //               itemBuilder: (BuildContext context, int index) {
                    //                 return Padding(
                    //                   padding: EdgeInsets.all(
                    //                     MediaQuery.of(context).devicePixelRatio * 7,
                    //                   ),
                    //                   child: Card_Poll(
                    //                     idPoll: listpoll[index].idPoll,
                    //                     poll: listpoll[index].poll,
                    //                     endDate: listpoll[index].endDate,
                    //                     status: listpoll[index].status,
                    //                     questionPollList: listpoll[index].questionPollList,
                    //                     voterList: listpoll[index].voterList,
                    //                   ),
                    //                 );
                    //               });
                    //         });
                    //       } else {
                    //         return Text(state.props.toString());
                    //       }
                    //     }),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
