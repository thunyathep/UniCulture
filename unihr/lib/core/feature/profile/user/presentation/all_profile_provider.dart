// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../domain/entity/all_user_profile_entity.dart';
// import '../domain/usecase/get_all_profile.dart';
//
//
// class AllProfileProvider extends ChangeNotifier {
//   final GetAllProfile getAllProfile;
//   AllProfileProvider({required this.getAllProfile});
//
//   AllProfileEntity _allprofileData = const AllProfileEntity();
//   String? _telephoneMobile;
//   String? _address;
//   String? _houseNo;
//   String? _village;
//   String? _villageNo;
//   String? _alley;
//   String? _road;
//   String? _subDistrict;
//   String? _district;
//   String? _province;
//   String? _areaCode;
//   String? _emergencyContact;
//   String? _emergencyRelationship;
//   String? _emergencyPhone;
//
//
//   AllProfileEntity get allprofileData => _allprofileData;
//   String? get telephoneMobile => _telephoneMobile;
//   String? get address => _address;
//   String? get houseNo => _houseNo;
//   String? get village => _village;
//   String? get villageNo => _villageNo;
//   String? get alley => _alley;
//   String? get road => _road;
//   String? get subDistrict => _subDistrict;
//   String? get district => _district;
//   String? get province => _province;
//   String? get areaCode => _areaCode;
//   String? get emergencyContact => _emergencyContact;
//   String? get emergencyRelationship => _emergencyRelationship;
//   String? get emergencyPhone => _emergencyPhone;
//
//
//   Future<void> getAllProfileData() async {
//     try {
//       var data = await getAllProfile();
//       _allprofileData = data.foldRight(_allprofileData, (r, previous) => r);
//       _telephoneMobile = _allprofileData.telephoneMobile;
//       _address = _allprofileData.address;
//       _houseNo = _allprofileData.houseNo;
//       _village = _allprofileData.village;
//       _villageNo = _allprofileData.villageNo;
//       _alley = _allprofileData.alley;
//       _road = _allprofileData.road;
//       _subDistrict = _allprofileData.subDistrict;
//       _district = _allprofileData.district;
//       _province = _allprofileData.provience;
//       _areaCode = _allprofileData.areaCode;
//       _emergencyContact = _allprofileData.emergencyContact;
//       _emergencyRelationship = _allprofileData.emergencyRelationship;
//       _emergencyPhone = _allprofileData.emergencyPhone;
//       notifyListeners();
//     } catch (error) {
//       log(error.toString());
//       notifyListeners();
//     }
//   }
//
//
//   void setPhoneNum(String num) {
//     _telephoneMobile = num;
//     notifyListeners();
//   }
//
//   void setAddress(
//       String zipcode,
//       String district,
//       String province,
//       String alley,
//       String houseNo,
//       String road,
//       String subDistrict,
//       String village,
//       String villageNo
//       ) {
//     _district = district;
//     _province = province;
//     _alley = alley;
//     _houseNo = houseNo;
//     _road = road;
//     _subDistrict = subDistrict;
//     _village = village;
//     _villageNo = villageNo;
//     _areaCode = zipcode;
//     notifyListeners();
//   }
//
//   void setEmergency(String contract, String relationship, String phone) {
//     _emergencyContact = contract;
//     _emergencyRelationship = relationship;
//     _emergencyPhone = phone;
//     notifyListeners();
//   }
//
//   static AllProfileProvider of(BuildContext context, {listen = true}) =>
//       Provider.of<AllProfileProvider>(context, listen: listen);
// }