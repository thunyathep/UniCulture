import 'package:equatable/equatable.dart';

class AllProfileEntity extends Equatable{
  final int? idEmployees;
  final String? employeeId;
  final String? titleTh;
  final String? firstnameTh;
  final String? lastnameTh;
  final String? nicknameTh;
  final String? titleEn;
  final DateTime? hiringDate;
  final String? personalId;
  final String? email;
  final String? telephoneMobile;
  final String? positionName;
  final String? sectionName;
  final String? departmentName;
  final dynamic divisionName;
  final String? address;
  final String? houseNo;
  final dynamic village;
  final String? villageNo;
  final dynamic alley;
  final dynamic road;
  final String? subDistrict;
  final String? district;
  final String? provience;
  final String? areaCode;
  final String? companyName;
  final String? firstnameEn;
  final String? lastnameEn;
  final dynamic nicknameEn;
  final int? idRole;
  final int? isActive;
  final DateTime? createDate;
  final dynamic createBy;
  final int? idPaymentType;
  final int? idCompany;
  final String? imageName;
  final int? servY;
  final int? servM;
  final int? userPf;
  final String? taxId;
  final String? maritalStatus;
  final int? idManagerLv1;
  final String? managerLv1FirstnameTh;
  final String? managerLv1LastnameTh;
  final String? managerLv1FirstnameEn;
  final String? managerLv1LastnameEn;
  final String? managerLv1Email;
  final int? idManagerLv2;
  final String? managerLv2FirstnameTh;
  final String? managerLv2LastnameTh;
  final String? managerLv2FirstnameEn;
  final String? managerLv2LastnameEn;
  final String? managerLv2Email;
  final String? managerLv1PositionName;
  final String? managerLv2PositionName;
  final String? emergencyContact;
  final String? emergencyRelationship;
  final String? emergencyPhone;
  final DateTime? birthday;
  final String? workingType;
  final DateTime? updateDate;
  final int? updateBy;
  final String? roleName;
  final List<String>? roles;
  final List<dynamic>? educations;
  final String? imageProfile;

  const AllProfileEntity({
    this.idEmployees,
    this.employeeId,
    this.titleTh,
    this.firstnameTh,
    this.lastnameTh,
    this.nicknameTh,
    this.titleEn,
    this.hiringDate,
    this.personalId,
    this.email,
    this.telephoneMobile,
    this.positionName,
    this.sectionName,
    this.departmentName,
    this.divisionName,
    this.address,
    this.houseNo,
    this.village,
    this.villageNo,
    this.alley,
    this.road,
    this.subDistrict,
    this.district,
    this.provience,
    this.areaCode,
    this.companyName,
    this.firstnameEn,
    this.lastnameEn,
    this.nicknameEn,
    this.idRole,
    this.isActive,
    this.createDate,
    this.createBy,
    this.idPaymentType,
    this.idCompany,
    this.imageName,
    this.servY,
    this.servM,
    this.userPf,
    this.taxId,
    this.maritalStatus,
    this.idManagerLv1,
    this.managerLv1FirstnameTh,
    this.managerLv1LastnameTh,
    this.managerLv1FirstnameEn,
    this.managerLv1LastnameEn,
    this.managerLv1Email,
    this.idManagerLv2,
    this.managerLv2FirstnameTh,
    this.managerLv2LastnameTh,
    this.managerLv2FirstnameEn,
    this.managerLv2LastnameEn,
    this.managerLv2Email,
    this.managerLv1PositionName,
    this.managerLv2PositionName,
    this.emergencyContact,
    this.emergencyRelationship,
    this.emergencyPhone,
    this.birthday,
    this.workingType,
    this.updateDate,
    this.updateBy,
    this.roleName,
    this.roles,
    this.educations,
    this.imageProfile,
  });
  @override
  List<Object?> get props => [];
}

class Education {
  final int? idEducations;
  final String? degree;
  final String? university;
  final String? faculty;
  final String? major;
  final int? fromYear;
  final int? endYear;
  final String? gpa;
  final int? idEmployees;

  Education({
    this.idEducations,
    this.degree,
    this.university,
    this.faculty,
    this.major,
    this.fromYear,
    this.endYear,
    this.gpa,
    this.idEmployees,
  });

}