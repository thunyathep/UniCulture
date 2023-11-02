class MissionEntity {
  int? idMission;
  DateTime? missionDate;
  int? reward;
  String? missionTitle;
  String? missionDetail;
  String? detail;
  String? keyLearning;
  String? file;
  int? idEmployee;
  int? createBy;
  int? idMissionStatus;
  DateTime? rewardDate;
  String? missionStatus;

  MissionEntity({
    this.idMission,
    this.missionDate,
    this.reward,
    this.missionTitle,
    this.missionDetail,
    this.detail,
    this.keyLearning,
    this.file,
    this.idEmployee,
    this.createBy,
    this.idMissionStatus,
    this.rewardDate,
    this.missionStatus,
  });
  @override
  List<Object?> get prop => [];
}
