import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../../core/feature/profile/user/data/datasource/remote/profile_remote.dart';
import '../../../../core/feature/profile/user/data/model/all_profile_user_model.dart';
import '../../data/model/heart_model.dart';
import '../bloc/heart_bloc.dart';
import '../bloc/heart_event.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:gradient_borders/gradient_borders.dart';


class SendHeart extends StatefulWidget {
  const SendHeart({Key? key}) : super(key: key);

  @override
  State<SendHeart> createState() => _SendHeartState();
}

class _SendHeartState extends State<SendHeart> {
  int selectIndex = -1;
  final ProfileRemoteDataSourceImpl profileRemoteDataSourceImpl = ProfileRemoteDataSourceImpl(client: http.Client());
  final HeartBloc _heartBloc = HeartBloc();
  late List<HeartTransferModel> listheart;
  TextEditingController? textController;
  int idReceiver = 0;
  int valueHeart = 0;
  late String? reply;
  String selectedUserName = "";


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => _heartBloc,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width*1,
                      child: Image.asset(
                        'assets/top_bar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.4,
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
                      child: Transform.rotate(
                        angle: 2 * math.pi/180,
                        child: Image.asset(
                          'assets/heartbig.png',
                          width: MediaQuery.of(context).size.width*0.45,
                          height: MediaQuery.of(context).size.height*0.23,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio*25,
                        left: MediaQuery.of(context).devicePixelRatio*60,
                      ),
                      child: Transform.rotate(
                        angle: 330 * math.pi/180,
                        child: Image.asset(
                          'assets/heartbig.png',
                          width: MediaQuery.of(context).size.width*0.15,
                          height: MediaQuery.of(context).size.height*0.15,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio*17,
                          left: MediaQuery.of(context).devicePixelRatio*17
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.18,
                            height: MediaQuery.of(context).size.height*0.08,
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
                                    ]
                                ),
                                width: 4,
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.18,
                              height: MediaQuery.of(context).size.height*0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Image.asset('assets/Unicorn.gif',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).devicePixelRatio*5,
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
                        top: MediaQuery.of(context).devicePixelRatio*40,
                        left: MediaQuery.of(context).devicePixelRatio*10,
                      ),
                      child: const Text(
                        'ส่งหัวใจเลย!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black,
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
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height*0.04,
                            ),
                          ),
                          Container(
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
                                      width: MediaQuery.of(context).size.width*0.06,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).devicePixelRatio*3,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.23,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xff757575).withOpacity(0.1),
                            ),
                            color: Color(0xffffffff).withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio * 10,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height *0.13,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff757575).withOpacity(0.2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ส่งให้",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.65,
                                            height: MediaQuery.of(context).size.height *0.04,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff8f8f8),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Stack(
                                              children: [
                                                TypeAheadField<AllProfileModel?>(
                                                  hideSuggestionsOnKeyboardHide: false,
                                                  textFieldConfiguration: TextFieldConfiguration(
                                                    decoration: InputDecoration(
                                                      prefix: Icon(
                                                        Icons.search,
                                                        color: Colors.transparent,
                                                      ),
                                                      suffixIcon: Icon(
                                                        Icons.search,
                                                        color: Colors.white,
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1,
                                                        ),
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1,
                                                        ),
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                    ),
                                                  ),

                                                  noItemsFoundBuilder: (context) => Center(
                                                    child: Text(
                                                      "No User Found.",
                                                      style: TextStyle(
                                                          fontSize: 24
                                                      ),
                                                    ),
                                                  ),
                                                  suggestionsCallback: profileRemoteDataSourceImpl.getAllProfile,
                                                  itemBuilder: (context, AllProfileModel? suggestion){
                                                    final user = suggestion!;
                                                    return ListTile(
                                                      title: Text(
                                                        user.firstName!+" " + user.lastName!,
                                                      ),
                                                    );
                                                  },
                                                  onSuggestionSelected: (AllProfileModel? suggestion){
                                                    final user = suggestion!;
                                                    idReceiver = user.idEmployee!;
                                                    selectedUserName = user.firstName! + " " + user.lastName!;
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: MediaQuery.of(context).devicePixelRatio*5,
                                                    top: MediaQuery.of(context).devicePixelRatio*2,
                                                  ),
                                                  child: Text(
                                                    selectedUserName,
                                                    style: TextStyle(
                                                      fontSize: 16, // You can adjust the font size as needed
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio * 10,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height *0.13,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff757575).withOpacity(0.2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "จำนวนหัวใจ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).devicePixelRatio*5,
                                          ),
                                          child: Wrap(
                                            children: List.generate(3, (index){
                                              int numberOfHearts = index + 1;
                                                return InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      selectIndex = index;
                                                      valueHeart = selectIndex + 1;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: MediaQuery.of(context).devicePixelRatio*2,
                                                    ),
                                                    child: Container(
                                                      height: MediaQuery.of(context).size.height * 0.04,
                                                      width: MediaQuery.of(context).size.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Color(0xffEC6C8B),
                                                        ),
                                                        gradient: selectIndex == index ? LinearGradient(
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
                                                        ) : null,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: List.generate(numberOfHearts, (heartIndex) {
                                                          return Image.asset(
                                                            "assets/heart.png",
                                                            width: MediaQuery.of(context).size.width * 0.05,
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio * 10,
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height *0.25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xff757575).withOpacity(0.2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).devicePixelRatio*5,
                                      left: MediaQuery.of(context).devicePixelRatio*10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ข้อความแทนคำขอบคุณ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                .devicePixelRatio*5,
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width*0.65,
                                            height: MediaQuery.of(context).size.height*0.15,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xfff5f5f5),
                                            ),
                                            child: TextFormField(
                                              controller: textController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).devicePixelRatio*5,
                                ),
                                child: InkWell(
                                  onTap: (){
                                    if(idReceiver != 0 && valueHeart != 0){
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20.0)), //this right here
                                              child: Container(
                                                height: MediaQuery.of(context).size.height*0.2,
                                                width: MediaQuery.of(context).size.width*0.8,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: MediaQuery.of(context).devicePixelRatio*10,
                                                      ),
                                                      child: Text(
                                                        "ส่งหัวใจเรียบร้อย!",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),


                                                    InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                          top: MediaQuery.of(context).devicePixelRatio*10,
                                                        ),
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width*0.6,
                                                          height: MediaQuery.of(context).size.height*0.04,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(20),
                                                            ),
                                                            color: Color(0xffF05F5F),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "ปิด",
                                                              style: TextStyle(
                                                                color: Color(0xffffffff),
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
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.7,
                                    height: MediaQuery.of(context).size.height*0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      gradient: idReceiver != 0 && valueHeart != 0 ?  LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffFCB0C2),
                                            Color(0xffF4BFCF),
                                            Color(0xffF0C5F1),
                                            Color(0xffE3DEF4),
                                            Color(0xffC1E1E7),
                                            Color(0xffC1E1E6),
                                          ]
                                      ): LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff757575).withOpacity(0.5),
                                            Color(0xff757575).withOpacity(0.5),
                                          ]
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "ส่งหัวใจ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
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
