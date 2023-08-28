import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/feature/question/presentation/bloc/question_bloc.dart';
import 'package:unihr/feature/question/presentation/bloc/question_event.dart';
import 'package:unihr/feature/question/presentation/bloc/question_state.dart';

import '../../data/model/question_model.dart';
import '../widget/card_morale.dart';


class Morale_Year extends StatefulWidget {
  const Morale_Year({Key? key}) : super(key: key);

  @override
  State<Morale_Year> createState() => _Morale_YearState();
}

class _Morale_YearState extends State<Morale_Year> {
  final QuestionBloc _questionBloc = QuestionBloc();
  late List<QuestionModel> listquestion;

  @override
  void initState(){
    _questionBloc.add(GetQuestion());
    super.initState();
  }

  bool _isDisposed = false ;

  @override
  void dispose(){
    super.dispose();
    _questionBloc.close();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _questionBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white
                                .withOpacity(0.0), // Start color with opacity
                            Colors.white.withOpacity(1), // End color with opacity
                          ],
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.035,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                            .devicePixelRatio *
                                            3,
                                      ),
                                      child: Text(
                                        '26',
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
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                            .devicePixelRatio *
                                            3,
                                      ),
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                        top: MediaQuery.of(context).devicePixelRatio * 50,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            BlocBuilder<QuestionBloc, QuestionState>(
                                builder: (context, state){
                                  if(state is MyQuestionLoadingState){
                                    return Text("");
                                  }else if(state is MyQuestionLoadedState){
                                    listquestion = state.listquestion;
                                    return LayoutBuilder(
                                        builder: (BuildContext context,
                                            BoxConstraints constraints) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                              const NeverScrollableScrollPhysics(),
                                              itemCount: listquestion.length,
                                              itemBuilder: (BuildContext context,
                                                  int index){
                                                int numberTopic = listquestion[index].questionTopic!.length;
                                                return Padding(
                                                  padding: EdgeInsets.all(
                                                    MediaQuery.of(context).devicePixelRatio*7,
                                                  ),
                                                  child: Card_Morale(
                                                      MoraleName: listquestion[index].moraleName!,
                                                      NumberTopic: listquestion[index].questionTopic!.length,
                                                      startDate: listquestion[index].startDate ?? DateTime.now(),
                                                      endDate: listquestion[index].endDate ?? DateTime.now(),
                                                      status: listquestion[index].status!,
                                                      moraleStatus: listquestion[index].moraleStatus!,
                                                  ),
                                                );
                                              }
                                          );
                                        }
                                    );
                                  }else{
                                    return Text(state.props.toString());
                                  }
                                }
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
