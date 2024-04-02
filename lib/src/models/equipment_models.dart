// ignore_for_file: public_member_api_docs, sort_constructors_first
class EquipmentModels {
  String name;
  String serialNumber;
  String state;
  String costCenter;
  String obs;
  List<String > image;

  EquipmentModels({
    required this.name,
    required this.serialNumber,
    required this.state,
    required this.costCenter,
    required this.obs,
    required this.image

  });

  factory EquipmentModels.fromMap(Map<String, dynamic> map){
    return EquipmentModels(
      name: map["name"], 
      serialNumber:  map["serialNumber"], 
      state:  map["state"], 
      costCenter: map["costCenter"],
      obs: map["obs"] ?? "",
      image: map["image"] ?? []
      );
   }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'serialNumber': serialNumber,
      'state': state,
      'costCenter': costCenter,
    };
  }

}
