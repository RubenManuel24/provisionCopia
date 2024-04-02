class HistoryModels {
 String id;
  String? name;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  String? costCenter;
  String supervisionId;
  String supervisorCode;
  HistoryModels({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.costCenter,
    required this.supervisionId,
    required this.supervisorCode,
  });

   factory HistoryModels.fromMap(Map<String, dynamic> map){
    return HistoryModels(
      id: map["_id"], 
      name:  map["name"], 
      createdAt:  map["createdAt"], 
      updatedAt: map["updatedAt"],
      deletedAt: map["deletedAt"],
      costCenter: map["costCenter"],
      supervisionId: map["supervisionId"], 
      supervisorCode: map["supervisorCode"],
      );
   }

   Map<String, dynamic> toMap(){
    return {
       "id": id,
       "name": name,
       "createdAt": createdAt,
       "updatedAt": updatedAt,
       "deletedAt": deletedAt,
       "costCenter": costCenter,
       "supervisionId": supervisionId,
       "supervisorCode": supervisorCode
    };
   }

}
