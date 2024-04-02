import 'employee_model.dart';
import 'equipment_models.dart';

class SuperVisionModel {
  String? createAt;
  String? updateAt;
  String? supervisorCode;
  int? numberOfWorkers;
  int? desiredNumber;
  List<EmployeeModel>? workerInformation;
  String? report;
  List<EquipmentModels>? equipment;
  String? taskId;
  String? time;
  String? costCenter;
  SuperVisionModel({
    this.createAt,
    this.updateAt,
    this.supervisorCode,
    this.numberOfWorkers,
    this.desiredNumber,
    this.workerInformation,
    this.report,
    this.equipment,
    this.taskId,
    this.time,
    this.costCenter,
  });

  factory SuperVisionModel.fromMap(Map<String, dynamic> map) {
    return SuperVisionModel(
      createAt: map["createdAt"] ?? " ",
      updateAt: map["updatedAt"] ?? " ",
      supervisorCode: map["supervisorCode"] ?? " ",
      numberOfWorkers: map["numberOfWorkers"] ?? 0,
      desiredNumber: map["desiredNumber"] ?? 0,
      workerInformation: ((map["workerInformation"]) as List<dynamic>)
          .map((e) => EmployeeModel.fromMap(e))
          .toList(),
      report: map["report"] ?? " ",
      equipment: ((map["equipment"]) as List<dynamic>)
          .map((e) => EquipmentModels.fromMap(e))
          .toList(),
      taskId: map["taskId"] ?? " ",
      time: map["time"],
      costCenter: map["costCenter"] ?? " ",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "createAt": createAt,
      "updateAt": updateAt,
      "supervisorCode": supervisorCode,
      "numberOfWorkers": numberOfWorkers,
      "desiredNumber": desiredNumber,
      "workerInformation": workerInformation,
      "report": report,
      "equipment": equipment,
      "taskId": taskId,
      "time": time,
      "costCenter": costCenter,
    };
  }
}
