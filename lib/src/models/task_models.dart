
class TaskModels {
  String id;
  String createdAt;
  String updatedAt;
  String supervisorCode;
  String costCenter;
  int desiredNumber;
  bool? state;
  
  TaskModels({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.supervisorCode,
    required this.costCenter,
    required this.desiredNumber,
    this.state
  });

  factory TaskModels.fromMap(Map<String, dynamic> map){
    return TaskModels(
      id: map["_id"],
      createdAt: map["createdAt"], 
      updatedAt: map["updatedAt"],
      supervisorCode: map["supervisorCode"],
      costCenter: map["costCenter"],
      desiredNumber: map["desiredNumber"] ?? 0,
      state: map["status"]
      );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
