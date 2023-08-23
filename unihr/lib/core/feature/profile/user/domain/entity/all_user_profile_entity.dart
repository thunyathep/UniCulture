import 'package:equatable/equatable.dart';

class AllProfileEntity extends Equatable{
  final int? idEmployee;
  final String? scgEmployeeId;
  final String? namePrefix;
  final String? firstName;
  final String? lastName;
  final String? positionId;
  final String? plEsop;
  final String? plGroup;
  final String? organizationId;
  final String? position;
  final String? section;
  final dynamic? division;
  final int? idDepartment;
  final String? companyCode;
  final String? location;
  final String? workingLocation;
  final String? employeeGroupCode;
  final String? employeeGroupText;
  final DateTime? birthDate;
  final DateTime? serviceDate;
  final DateTime? positionEntryDate;
  final DateTime? plDate;
  final int? outsideEquivalentServiceYear;
  final int? outsideEquivalentServiceMonth;
  final String? employeeTypeId;
  final String? reportToPersonnelNumber;
  final String? reportToName;
  final String? reportToPosition;
  final String? reportToEmail;
  final String? managerPersonnelNumber;
  final String? managerName;
  final String? managerPosition;
  final String? managerEmail;
  final String? gender;
  final dynamic? profile;
  final dynamic? experience;
  final dynamic? gap;
  final String? telephoneMobile;
  final String? emailAddressBusiness;
  final String? username;
  final int? idRole;
  final int? updateBy;
  final dynamic? updateAt;

  const AllProfileEntity({
    this.idEmployee,
    this.scgEmployeeId,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.positionId,
    this.plEsop,
    this.plGroup,
    this.organizationId,
    this.position,
    this.section,
    this.division,
    this.idDepartment,
    this.companyCode,
    this.location,
    this.workingLocation,
    this.employeeGroupCode,
    this.employeeGroupText,
    this.birthDate,
    this.serviceDate,
    this.positionEntryDate,
    this.plDate,
    this.outsideEquivalentServiceYear,
    this.outsideEquivalentServiceMonth,
    this.employeeTypeId,
    this.reportToPersonnelNumber,
    this.reportToName,
    this.reportToPosition,
    this.reportToEmail,
    this.managerPersonnelNumber,
    this.managerName,
    this.managerPosition,
    this.managerEmail,
    this.gender,
    this.profile,
    this.experience,
    this.gap,
    this.telephoneMobile,
    this.emailAddressBusiness,
    this.username,
    this.idRole,
    this.updateBy,
    this.updateAt,
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