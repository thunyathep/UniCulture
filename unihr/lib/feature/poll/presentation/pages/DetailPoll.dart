import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_bloc.dart';
import 'package:unihr/feature/poll/presentation/bloc/poll_event.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/poll_entity.dart';

class DetailPoll extends StatefulWidget {
  final int idPoll;
  final String poll;
  final DateTime endDate;
  final String status;
  final List<QuestionPollList>? questionPollList;
  final List<VoterList>? voterList;
  const DetailPoll({
    Key? key,
    required this.idPoll,
    required this.poll,
    required this.endDate,
    required this.status,
    required this.questionPollList,
    required this.voterList,
  }) : super(key: key);

  @override
  State<DetailPoll> createState() => _DetailPollState();
}

class _DetailPollState extends State<DetailPoll> {
  final PollBloc _pollBloc = sl<PollBloc>();
  int current = -1;
  int idEmployee = 0;
  int idpoll = 0;
  int idquestion = 0;

  Future<void> getId() async {
    String id = await LoginStorage.readEmployeeId();
    try {
      idEmployee = int.parse(id);
      // Now, you can use idSender as an int.
      print("Parsed integer ID: $idEmployee");
    } catch (e) {
      // Handle the case where the string cannot be parsed as an integer.
      print("Error parsing string to int: $e");
    }
  }

  @override
  void initState() {
    getId();
    super.initState();
  }

  bool _isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _pollBloc,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Image.asset(
                        'assets/mission_card.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white
                                .withOpacity(0.0), // Start color with opacity
                            Colors.white
                                .withOpacity(0.7), // End color with opacity
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 20,
                      ),
                      child: Center(
                        child: Text(
                          "โหวต",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 35,
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.035,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0xff6ED33F),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              color: Color(0xff6ED33F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                              color: Colors.black,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: Text(
                        widget.poll,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.58,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListView.builder(
                          itemCount: widget.questionPollList!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                    idpoll = widget.idPoll;
                                    idquestion = widget.questionPollList![index]
                                        .idPollQuestion!;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff757575).withOpacity(0.3),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(40),
                                    ),
                                    gradient: current == index
                                        ? LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Color(0xffFCB0C2),
                                              Color(0xffF4BFCF),
                                              Color(0xffF0C5F1),
                                              Color(0xffE3DEF4),
                                              Color(0xffC1E1E7),
                                              Color(0xffC1E1E6),
                                            ],
                                          )
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.questionPollList![index].question!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (idEmployee != 0 &&
                                idpoll != 0 &&
                                idquestion != 0) {
                              _pollBloc.add(AnswerPoll(
                                idEmployee: idEmployee,
                                idPoll: idpoll,
                                idPollQuestion: idquestion,
                              ));
                              Navigator.of(context).pop();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0)), //this right here
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    10,
                                              ),
                                              child: Text(
                                                "โหวตสำเร็จ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .devicePixelRatio *
                                                      10,
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                    color: Color(0xffF05F5F),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "ปิด",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                              Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              gradient: idEmployee != 0 &&
                                      idpoll != 0 &&
                                      idquestion != 0
                                  ? LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                          Color(0xffFCB0C2),
                                          Color(0xffF4BFCF),
                                          Color(0xffF0C5F1),
                                          Color(0xffE3DEF4),
                                          Color(0xffC1E1E7),
                                          Color(0xffC1E1E6),
                                        ])
                                  : LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                          Color(0xff757575).withOpacity(0.5),
                                          Color(0xff757575).withOpacity(0.5),
                                        ]),
                            ),
                            child: Center(
                              child: Text(
                                "โหวต",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
