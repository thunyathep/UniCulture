import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:unihr/core/feature/profile/user/domain/repository/profile_repository.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';
import '../../../../core/feature/profile/user/data/datasource/remote/profile_remote.dart';
import '../../../../core/feature/profile/user/data/model/all_profile_user_model.dart';
import '../../../../core/storage/secure_storage.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final ProfileRemoteDataSourceImpl profileRemoteDataSourceImpl = ProfileRemoteDataSourceImpl(client: http.Client());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                        top: MediaQuery.of(context).devicePixelRatio*20,
                    ),
                    child: Row(
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
                          width: MediaQuery.of(context).size.width*0.8,
                          height: MediaQuery.of(context).size.height*0.05,
                          child: TypeAheadField<AllProfileModel?>(
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
                                hintText: "ค้นหารายชื่อ",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffE994C0),
                                    width: 2.5,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffE994C0),
                                    width: 2.5,
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
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class User{
//   final String firstName;
//   final String lastName;
//
//   const User({
//     required this.firstName,
//     required this.lastName
//   });
//
//   static User fromJson(Map<String, dynamic> json ) => User(
//     firstName: json["firstName"],
//     lastName: json["lastName"],
//   );
// }

// class UserApi {
//   static Future<List<AllProfileModel>> getUserSuggestion(String query) async{
//     final url = Uri.parse(
//         "https://uniculture-371814.as.r.appspot.com/api/users");
//     final response = await http.get(url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'x-access-token': '${await LoginStorage.readToken()}',
//         }
//     );
//     if (response.statusCode == 200) {
//       final List users = json.decode(response.body);
//       final List<AllProfileModel> profileList =
//       users.map((json) => AllProfileModel.fromJson(json)).where((user){
//         final firstnameLower = user.firstnameEn?.toLowerCase();
//         final queryLower = query.toLowerCase();
//
//         return firstnameLower?.contains(queryLower);
//       }).toList();
//       return profileList;
//     } else {
//       throw SeverException();
//     }
//   }
// }