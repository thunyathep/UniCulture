import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:unihr/feature/communicate/presentation/bloc/communicate_bloc.dart';
import 'package:unihr/feature/communicate/presentation/bloc/communicate_event.dart';
import 'package:unihr/feature/communicate/presentation/bloc/communicate_state.dart';
import 'package:unihr/feature/communicate/presentation/widget/cardSuggest.dart';
import 'dart:math' as math;

import '../../data/model/communicate_model.dart';
import '../../domain/entity/communicate_entity.dart';
import 'AddSuggestion.dart';
import 'DetailSuggestion.dart';



class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  void initState(){
    _communicateBloc.add(GetCommunicate());
    super.initState();
  }

  bool _isDisposed = false ;

  @override
  void dispose(){
    super.dispose();
    _communicateBloc.close();
    _isDisposed = true;
  }

  final CommunicateBloc _communicateBloc = CommunicateBloc();
  late List<CommunicateModel> listcommunicate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _communicateBloc,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width*1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width*1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0), // Start color with opacity
                            Colors.white.withOpacity(1), // End color with opacity
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio*2,
                        ),
                        child: Image.asset(
                          'assets/chatbox.png',
                          width: MediaQuery.of(context).size.width*0.5,
                          height: MediaQuery.of(context).size.height*0.27,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*22,
                        left: MediaQuery.of(context).devicePixelRatio*20,
                      ),
                      child: Text(
                        "บอร์ดพูดคุย",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height*0.04,
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
                BlocBuilder<CommunicateBloc, CommunicateState>(
                    builder: (context, state){
                      if(state is CommunicateLoadingState){
                        return Text("Loading");
                      }else if(state is CommunicateLoadedState){
                        listcommunicate = state.listcommunicate;
                        return LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount: listcommunicate.length,
                                  itemBuilder: (BuildContext context,
                                      int index){
                                    return Padding(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).devicePixelRatio*7,
                                      ),
                                      child: Card_Suggestion(
                                          communicateBloc: _communicateBloc,
                                          idCommunicate: listcommunicate[index]
                                              .idCommunication,
                                          type: listcommunicate[index].type,
                                          detail: listcommunicate[index].detail,
                                          file: listcommunicate[index].file,
                                          createDate: listcommunicate[index]
                                              .createDate,
                                          status: listcommunicate[index].status,
                                          reward: listcommunicate[index].reward,
                                          rewardDate: listcommunicate[index]
                                              .rewardDate,
                                          createBy: listcommunicate[index]
                                              .createBy,
                                          firstName: listcommunicate[index]
                                              .firstName,
                                          lastName: listcommunicate[index]
                                              .lastName,
                                          replyList: listcommunicate[index]
                                              .replyList ?? [],
                                          likeList: listcommunicate[index]
                                              .likeList ?? [],
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

                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AddSuggestion()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color(0xff757575),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xff757575),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).devicePixelRatio*1,
                            left: MediaQuery.of(context).devicePixelRatio*2,
                          ),
                          child: Text(
                            "สร้างข้อเสนอแนะ",
                            style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
