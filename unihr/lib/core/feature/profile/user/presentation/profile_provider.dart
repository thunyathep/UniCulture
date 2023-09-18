import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unihr/core/feature/profile/user/data/model/profile_model.dart';

import '../../../../error/failure.dart';
import '../domain/entity/profile_entity.dart';
import '../domain/usecase/get_profile.dart';


class ProfileProvider extends ChangeNotifier {
  final GetProfile getProfile;
  ProfileProvider({required this.getProfile});

  ProfileEntity _profileData = const ProfileEntity(firstName: '');
  String? _telephoneMobile;
  String? _address;
  String? _houseNo;
  String? _village;
  String? _villageNo;
  String? _alley;
  String? _road;
  String? _subDistrict;
  String? _district;
  String? _province;
  String? _areaCode;
  String? _emergencyContact;
  String? _emergencyRelationship;
  String? _emergencyPhone;


  ProfileEntity get profileData => _profileData;
  String? get telephoneMobile => _telephoneMobile;
  String? get address => _address;
  String? get houseNo => _houseNo;
  String? get village => _village;
  String? get villageNo => _villageNo;
  String? get alley => _alley;
  String? get road => _road;
  String? get subDistrict => _subDistrict;
  String? get district => _district;
  String? get province => _province;
  String? get areaCode => _areaCode;
  String? get emergencyContact => _emergencyContact;
  String? get emergencyRelationship => _emergencyRelationship;
  String? get emergencyPhone => _emergencyPhone;


  Future<void> getProfileData() async {
    try {
      var data = await getProfile();
      _profileData = data.foldRight(_profileData, (r, previous) => r);
      // log("${data.foldRight(_profileData, (r, previous) => r)}");
      _telephoneMobile = _profileData.telephoneMobile;
      notifyListeners();
    } catch (error) {
      log(error.toString());
      notifyListeners();
    }
  }


  void setPhoneNum(String num) {
    _telephoneMobile = num;
    notifyListeners();
  }


  static ProfileProvider of(BuildContext context, {listen = true}) =>
      Provider.of<ProfileProvider>(context, listen: listen);
}