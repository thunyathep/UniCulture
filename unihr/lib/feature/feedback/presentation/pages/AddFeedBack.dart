import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;
import 'package:unihr/feature/feedback/presentation/bloc/feedback_event.dart';
import 'dart:math' as math;

import 'package:unihr/feature/pocket/presentation/widget/show_coin.dart';

import '../../../../core/feature/profile/user/data/datasource/remote/profile_remote.dart';
import '../../../../core/feature/profile/user/data/model/all_profile_user_model.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../injection_container.dart';
import '../bloc/feedback_bloc.dart';

class AddFeedBack extends StatefulWidget {
  const AddFeedBack({Key? key}) : super(key: key);

  @override
  State<AddFeedBack> createState() => _AddFeedBackState();
}

class _AddFeedBackState extends State<AddFeedBack> {
  final FeedbackBloc _feedbackBloc = sl<FeedbackBloc>();
  TextEditingController _typeAheadController = TextEditingController();
  final ProfileRemoteDataSourceImpl profileRemoteDataSourceImpl =
      ProfileRemoteDataSourceImpl(client: http.Client());
  TextEditingController? textController;
  int idReceiver = 0;
  String selectedUserName = "";
  String feedback = "";
  String feedbacktype = "identify";
  int idSender = 0;
  Future<void> getId() async {
    String id = await LoginStorage.readEmployeeId();
    try {
      idSender = int.parse(id);
      // Now, you can use idSender as an int.
      print("Parsed integer ID: $idSender");
    } catch (e) {
      // Handle the case where the string cannot be parsed as an integer.
      print("Error parsing string to int: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  void clearSelectedUserName() {
    setState(() {
      selectedUserName = "";
    });
  }

  // void _countWords() {
  //   final words = _textEditingController.text.split(' ');
  //   setState(() {
  //     _wordCount = words.length;
  //   });
  // }
  bool val = false;
  Incognito(bool newVal) {
    setState(() {
      val = newVal;
      if (val == false) {
        feedbacktype = "identify";
      } else if (val == true) {
        feedbacktype = "anonymous";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocProvider(
            create: (_) => _feedbackBloc,
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
                          'assets/handfeedback.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.27,
                          fit: BoxFit.cover,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio *
                                      10,
                                  left:
                                      MediaQuery.of(context).devicePixelRatio *
                                          10,
                                ),
                                child: Text(
                                  "เพิ่มฟีดแบค",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        10,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff8f8f8),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        TypeAheadField<AllProfileModel?>(
                                          hideSuggestionsOnKeyboardHide: true,
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            controller: _typeAheadController,
                                            onTap: (){
                                              clearSelectedUserName();
                                            },
                                            decoration: InputDecoration(
                                              prefix: Icon(
                                                Icons.search,
                                                color: Colors.transparent,
                                              ),
                                              suffixIcon: Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ),
                                          noItemsFoundBuilder: (context) =>
                                              Center(
                                            child: Text(
                                              "No User Found.",
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          ),
                                          suggestionsCallback:
                                              profileRemoteDataSourceImpl
                                                  .getAllProfile,
                                          itemBuilder: (context,
                                              AllProfileModel? suggestion) {
                                            final user = suggestion!;
                                            return ListTile(
                                              title: Text(
                                                user.firstName! +
                                                    " " +
                                                    user.lastName!,
                                              ),
                                            );
                                          },
                                          onSuggestionSelected:
                                              (AllProfileModel? suggestion) {
                                            _typeAheadController.clear();
                                            getId();
                                            final user = suggestion!;
                                            idReceiver = user.idEmployee!;
                                            selectedUserName = user.firstName! +
                                                " " +
                                                user.lastName!;
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                5,
                                            top: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                2,
                                          ),
                                          child: Text(
                                            selectedUserName,
                                            style: TextStyle(
                                              fontSize:
                                                  16, // You can adjust the font size as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context)
                                            .devicePixelRatio *
                                        10,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xfff5f5f5),
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        feedback = value;
                                      });
                                    },
                                    controller: textController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'กรุณากรอกข้อความ';
                                      } else {
                                        return null;
                                      }
                                    },
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xfff5f5f5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "ข้อความ",
                                      hintStyle: TextStyle(
                                        color: Color(0xff757575),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio *
                                      5,
                                  left:
                                      MediaQuery.of(context).devicePixelRatio *
                                          10,
                                ),
                                child: Row(
                                  children: [
                                    SwitchIncognito(val, Incognito),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context)
                                                .devicePixelRatio *
                                            2,
                                      ),
                                      child: Text(
                                        "ไม่ระบุตัวตน",
                                        style: TextStyle(
                                          color: Color(0xff757575),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (idReceiver != 0 &&
                                        idSender != 0 &&
                                        feedback != "") {
                                      _feedbackBloc.add(SendingFeedBackEvent(
                                          feedback: feedback,
                                          feedbackType: feedbacktype,
                                          idReceiver: idReceiver,
                                          idSender: idSender));
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)), //this right here
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .devicePixelRatio *
                                                            10,
                                                      ),
                                                      child: Text(
                                                        "เพิ่มฟีดแบคสำเร็จ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: MediaQuery.of(
                                                                      context)
                                                                  .devicePixelRatio *
                                                              10,
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                            color: Color(
                                                                0xffF05F5F),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "ปิด",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffffffff),
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
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context)
                                              .devicePixelRatio *
                                          15,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      gradient: idReceiver != 0 &&
                                              idSender != 0 &&
                                              feedback != ""
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
                                                  Color(0xff757575)
                                                      .withOpacity(0.5),
                                                  Color(0xff757575)
                                                      .withOpacity(0.5),
                                                ]),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "เพิ่มฟีดแบค",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SwitchIncognito(bool val, Function onChange) {
    return CupertinoSwitch(
      trackColor: Colors.grey,
      activeColor: Color(0xffF4BFCF),
      value: val,
      onChanged: (newValue) {
        onChange(newValue);
      },
    );
  }
}
